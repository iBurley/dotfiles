{ pkgs, pkgs-unstable, ... }:

{

  home.packages =
    (with pkgs; [
      discord
      epiphany
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
      jellyfin-media-player
      libnotify
      libreoffice
      loupe
      nautilus
      newsflash
      papers
      prismlauncher
      simple-scan
      spotify
      xclip
      yt-dlp
    ])
    ++ (with pkgs-unstable; [
      (alpaca.override { ollama = ollama-rocm; })
      (bottles.override { removeWarningPopup = true; })
    ]);

}
