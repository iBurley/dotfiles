{ pkgs, pkgs-unstable,  ... }:

{

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
    noto-fonts-emoji
    prismlauncher
    spotify
    xclip
    yt-dlp
  ]) ++ (with pkgs-unstable; [
    (alpaca.override { ollama = ollama-rocm; })
    celluloid
    zed-editor
  ]);

}
