{ pkgs, pkgs-unstable, ... }:

{

  environment.systemPackages =
    (with pkgs; [
      discord
      ffmpeg
      file-roller
      fragments
      gajim
      gnome-boxes
      imagemagick
      libnotify
      libreoffice
      newsflash
      prismlauncher
      spotify
      wl-clipboard
      wl-screenrec
      yt-dlp
    ])
    ++ (with pkgs-unstable; [
      (alpaca.override { ollama = ollama-rocm; })
      (bottles.override { removeWarningPopup = true; })
    ]);

}
