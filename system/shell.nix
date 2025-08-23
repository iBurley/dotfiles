{ pkgs, ... }:

{

  programs.bash = {
    promptInit = ''
      source ${pkgs.git}/share/git/contrib/completion/git-prompt.sh
      PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "  %s")'; PS1='\[\e[1;32m\]\w''${PS1_CMD1}\[\e[0m\] \[\e[1;32m\]󰅂\[\e[0m\] '
    '';
    shellAliases = {
      xcopy = "xclip -i -selection clipboard";
      xpaste = "xclip -o -selection clipboard";
      yt-mp3 = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --output '%(title)s.%(ext)s'";
    };
    shellInit = ''
      yt-clip () {
        yt-dlp -f "bv*[height<=1080]+ba" --download-sections "*$1-$2" $3 -q --no-warnings -P '~/Videos' -o 'Clip - %(title)s.%(ext)s' --remux-video mp4
      }
    '';
  };

}
