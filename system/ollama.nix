{ pkgs, ... }:

{

  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    acceleration = "rocm";
    rocmOverrideGfx = "11.0.0";
    environmentVariables = {
      OLLAMA_FLASH_ATTENTION = "1";
      OLLAMA_GPU_LAYERS = "-1";
      OLLAMA_MAX_LOADED_MODELS = "1";
      OLLAMA_NUM_GPU = "1";
      OLLAMA_NUM_PARALLEL = "1";
    };
    loadModels = [ "qwen3-vl:8b" ];
  };

  services.open-webui = {
    enable = true;
    environment = {
      OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
      WEBUI_AUTH = "False";
    };
  };

}
