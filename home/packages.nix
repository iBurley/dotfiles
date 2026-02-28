{ pkgs, pkgs-unstable, ... }:

{

  home.packages =
    (with pkgs; [
      discord
      ffmpeg
      file-roller
      fragments
      gnome-boxes
      imagemagick
      libnotify
      libreoffice
      newsflash
      prismlauncher
      spotify
      wl-clipboard
      yt-dlp
    ])
    ++ (with pkgs-unstable; [
      (alpaca.override { ollama = ollama-rocm; })
      (bottles.override { removeWarningPopup = true; })
    ]);

}
