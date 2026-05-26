{ pkgs, pkgs-unstable, ... }:

{

  environment.systemPackages = with pkgs; [
    jq
    glow
  ];

  programs.bash.interactiveShellInit = ''
    llm () {
      local prompt="$* Be concise but complete."
      [[ ! -t 0 ]] && prompt="$(cat) $prompt"
      curl -s http://localhost:11434/api/generate -d "$(jq -nc --arg p "$prompt" --arg m "gemma4:e4b" '{model:$m,prompt:$p,stream:false}')" | jq -r '.response' | glow
    }
  '';

  services.ollama = {
    enable = true;
    package = pkgs-unstable.ollama-rocm;
    rocmOverrideGfx = "11.0.0";
    environmentVariables = {
      OLLAMA_FLASH_ATTENTION = "1";
      OLLAMA_MAX_LOADED_MODELS = "1";
      OLLAMA_NUM_PARALLEL = "1";
    };
  };

  # services.open-webui = {
  #   enable = true;
  #   environment = {
  #     OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
  #     WEBUI_AUTH = "False";
  #   };
  # };

}
