{

  programs.bash = {
    promptInit = ''
      GREEN_BOLD="\[\033[1;32m\]"
      YELLOW_BOLD="\[\033[1;33m\]"
      RESET="\[\033[0m\]"

      set_prompt() {
        local dir="$PWD" ref git_section=""

        while [ -n "$dir" ]; do
          if [ -f "$dir/.git/HEAD" ]; then
            read -r ref < "$dir/.git/HEAD"
            case "$ref" in
              ref:*) git_section=" ''${YELLOW_BOLD}''${ref##*/}''${RESET}" ;;
            esac
            break
          fi
          dir=''${dir%/*}
        done

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

      yt-clip () {
        yt-dlp -f "bv*[height<=1080]+ba/b[height<=1080]" --download-sections "*$1-$2" --force-keyframes-at-cuts --remux-video mp4 -q --no-warnings -P '~/Videos' -o 'Clip - %(title)s.%(ext)s' "$3"
      }
    '';
  };

}
