{

  imports = [
    ./dconf.nix
    ./firefox.nix
    ./mpv.nix
    ./nautilus-scripts.nix
    ./neovim.nix
    ./packages.nix
  ];

  home.username = "iburley";
  home.homeDirectory = "/home/iburley";

  xdg.configFile."user-dirs.dirs".force = true;
  xdg.userDirs = {
    enable = true;
    music = "/mnt/Storage/Music";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      xcopy = "xclip -i -selection clipboard";
      xpaste = "xclip -o -selection clipboard";
      yt-mp3 = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --output '%(title)s.%(ext)s'";
    };
    initExtra = ''
      yt-clip () {
        yt-dlp -f "bv*[height<=1080]+ba/b" --download-sections "*$1-$2" --force-keyframes-at-cuts $3 -q --no-warnings -P '~/Videos' -o 'Clip - %(title)s.%(ext)s' --remux-video mp4
      }
    '';
  };

  home.stateVersion = "24.05";

}
