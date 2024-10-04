{ pkgs, pkgs-unstable,  ... }:

{

  imports = [
    ./dconf.nix
    ./firefox.nix
    ./mpv.nix
    ./nautilus-scripts.nix
    ./neovim.nix
  ];

  home.username = "iburley";
  home.homeDirectory = "/home/iburley";

  home.packages = (with pkgs; [
    discord
    epiphany
    evince
    ffmpeg
    fragments
    gnome-console
    gnome-text-editor
    gnome.file-roller
    gnome.gnome-boxes
    gnome.gnome-calculator
    gnome.gnome-calendar
    gnome.gnome-clocks
    gnome.gnome-disk-utility
    gnome.gnome-font-viewer
    gnome.gnome-logs
    gnome.gnome-music
    gnome.gnome-system-monitor
    gnome.nautilus
    gnome.simple-scan
    imagemagick
    libnotify
    libreoffice
    loupe
    mousai
    (nerdfonts.override { fonts = [ "SourceCodePro" ]; })
    newsflash
    prismlauncher
    spotify
    xclip
    yt-dlp
  ]) ++ (with pkgs-unstable; [
    (alpaca.override { ollama = ollama-rocm; })
    celluloid
    zed-editor
  ]);

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
        yt-dlp -f "bv*[height<=1080]+ba/b" --download-sections "*$1-$2" --force-keyframes-at-cuts $3 -q --no-warnings -P '~/Videos' -o 'Clip - %(title)s.mp4'
      }
    '';
  };

  home.stateVersion = "24.05";

}
