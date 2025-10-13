{ pkgs, ... }:

{

  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    acceleration = "rocm";
    environmentVariables = {
      OLLAMA_GPU_OVERHEAD = "0";
      OLLAMA_MAX_LOADED_MODELS = "1";
      OLLAMA_NUM_PARALLEL = "1";
      OLLAMA_KEEP_ALIVE = "-1";
    };
    loadModels = [
      "gemma3:12b"
    ];
  };

  #services.open-webui = {
  #  enable = true;
  #  environment = {
  #    OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
  #    WEBUI_AUTH = "False";
  #    DO_NOT_TRACK = "True";
  #    SCARF_NO_ANALYTICS = "True";
  #    ANONYMIZED_TELEMETRY = "False";
  #  };
  #};

}
