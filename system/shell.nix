{

  programs.bash = {
    promptInit = ''
      GREEN_BOLD="\[\033[1;32m\]"
      YELLOW_BOLD="\[\033[1;33m\]"
      RESET="\[\033[0m\]"

      set_prompt() {
        local git_branch=$(git branch 2>/dev/null | grep '^*' | cut -d' ' -f2-)
        local git_section=""

        if [[ -n "$git_branch" ]]; then
          git_section=" ''${YELLOW_BOLD}''${git_branch}''${RESET}"
        fi

        PS1="''${GREEN_BOLD}\w''${RESET}''${git_section} "
        printf "\033[6 q"
      }

      PROMPT_COMMAND='set_prompt'
    '';
    shellAliases = {
      dots = "nvim ~/.dotfiles";
      xcopy = "xclip -i -selection clipboard";
      xpaste = "xclip -o -selection clipboard";
      yt-mp3 = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --output '%(title)s.%(ext)s'";
    };
    interactiveShellInit = ''
      yt-clip () {
        yt-dlp -f "bv*[height<=1080]+ba" --download-sections "*$1-$2" $3 -q --no-warnings -P '~/Videos' -o 'Clip - %(title)s.%(ext)s' --remux-video mp4
      }
    '';
  };

}
