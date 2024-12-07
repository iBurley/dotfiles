{ pkgs, pkgs-unstable, ... }:

{

  home.packages = (with pkgs; [
    discord
    epiphany
    evince
    ffmpeg
    fragments
    gnome-builder
    gnome-console
    gnome-text-editor
    file-roller
    gnome-boxes
    gnome-calculator
    gnome-calendar
    gnome-clocks
    gnome-disk-utility
    gnome-font-viewer
    gnome-logs
    gnome-music
    gnome-system-monitor
    nautilus
    simple-scan
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
    bottles
    zed-editor
  ]);

}
