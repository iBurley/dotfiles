{

  programs.bash = {
    enable = true;
    shellAliases = {
      xcopy = "xclip -i -selection clipboard";
      xpaste = "xclip -o -selection clipboard";
      yt-mp3 = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --output '%(title)s.%(ext)s'";
    };
    shellInit = ''
      yt-clip () {
        yt-dlp -f "bv*[height<=1080]+ba" --download-sections "*$1-$2" --force-keyframes-at-cuts $3 -q --no-warnings -P '~/Videos' -o 'Clip - %(title)s.%(ext)s' --remux-video mp4
      }
    '';
  };

}
