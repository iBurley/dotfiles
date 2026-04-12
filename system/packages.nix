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
      mumble
      newsflash
      prismlauncher
      spotify
      wl-clipboard
      yt-dlp
    ])
    ++ (with pkgs-unstable; [
      (bottles.override { removeWarningPopup = true; })
    ]);

}
