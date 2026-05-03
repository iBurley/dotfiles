{

  programs.bash = {
    promptInit = ''
      GREEN_BOLD="\[\033[1;32m\]"
      YELLOW_BOLD="\[\033[1;33m\]"
      RESET="\[\033[0m\]"

      set_prompt() {
        local git_branch git_section

        if [[ -f .git/HEAD ]]; then
          read -r git_branch < .git/HEAD
          git_section=" ''${YELLOW_BOLD}''${git_branch##*/}''${RESET}"
        fi

        PS1="''${GREEN_BOLD}\w''${RESET}''${git_section} "
        printf "\033[6 q"
      }

      PROMPT_COMMAND='set_prompt'
    '';
    shellAliases = {
      ls = "ls --color --group-directories-first";
      myip = "curl -s4 https://icanhazip.com";
      yt-mp3 = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --output '%(title)s.%(ext)s'";
    };
    interactiveShellInit = ''
      export HISTIGNORE="&:[ ]*:clear:exit:history:ls:myip:nvim:pwd:top"

      llm () {
        prompt="$* Be concise but complete."
        [ ! -t 0 ] && prompt="$(cat) $prompt"
        curl -s http://localhost:11434/api/generate -d "$(jq -n --arg p "$prompt" '{model:"gemma4:e4b",prompt:$p,stream:false}')" | jq -r '.response' | glow
      }

      yt-clip () {
        yt-dlp -f "bv*[height<=1080]+ba/b[height<=1080]" --download-sections "*$1-$2" --force-keyframes-at-cuts --remux-video mp4 -q --no-warnings -P '~/Videos' -o 'Clip - %(title)s.%(ext)s' "$3"
      }
    '';
  };

}
