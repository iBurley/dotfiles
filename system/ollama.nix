{ pkgs-unstable, ... }:

{

  services.ollama = {
    enable = true;
    package = pkgs-unstable.ollama-rocm;
    rocmOverrideGfx = "11.0.0";
    environmentVariables = {
      OLLAMA_FLASH_ATTENTION = "1";
      OLLAMA_KEEP_ALIVE = "5m";
      OLLAMA_KV_CACHE_TYPE = "bf16";
      OLLAMA_MAX_LOADED_MODELS = "1";
      OLLAMA_NUM_PARALLEL = "2";
    };
  };

  services.open-webui = {
    enable = true;
    environment = {
      OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
      WEBUI_AUTH = "False";
    };
  };

}
