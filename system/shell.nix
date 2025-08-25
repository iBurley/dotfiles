{ pkgs, ... }:

{

  programs.bash = {
    promptInit = ''
      source ${pkgs.git}/share/git/contrib/completion/git-prompt.sh
      PROMPT_COLOR="1;32m"
      PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "  %s")'; PS1='\[\033['$PROMPT_COLOR'\]\w''${PS1_CMD1} 󰅂\[\033[0m\] '
    '';
    shellAliases = {
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
