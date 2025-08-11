{ pkgs, pkgs-unstable, ... }:

{

  home.packages = (with pkgs; [
    discord
    epiphany
    ffmpeg
    file-roller
    fragments
    git
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
    nerd-fonts.monaspace
    newsflash
    noto-fonts-emoji
    papers
    prismlauncher
    simple-scan
    spotify
    xclip
    yt-dlp
  ]) ++ (with pkgs-unstable; [
    (alpaca.override { ollama = ollama-rocm; })
    (bottles.override { removeWarningPopup = true; })
  ]);

}
