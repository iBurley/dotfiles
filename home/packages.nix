{ pkgs, pkgs-unstable, ... }:

{

  home.packages = (with pkgs; [
    (alpaca.override { ollama = ollama-rocm; })
    discord
    easyeffects
    epiphany
    evince
    ffmpeg
    file-roller
    fragments
    gnome-boxes
    gnome-calculator
    gnome-calendar
    gnome-clocks
    gnome-console
    gnome-disk-utility
    gnome-font-viewer
    gnome-logs
    gnome-music
    gnome-system-monitor
    gnome-text-editor
    imagemagick
    libnotify
    libreoffice
    loupe
    nautilus
    nerd-fonts.symbols-only
    newsflash
    noto-fonts-emoji
    prismlauncher
    simple-scan
    spotify
    xclip
    yt-dlp
  ]) ++ (with pkgs-unstable; [
    zed-editor
  ]);

}
