{ pkgs, pkgs-unstable, ... }:

{

  environment.systemPackages =
    (with pkgs; [
      ffmpeg
      file-roller
      fragments
      gnome-boxes
      imagemagick
      libnotify
      libreoffice
      newsflash
      prismlauncher
      wl-clipboard
      yt-dlp
    ])
    ++ (with pkgs-unstable; [
      # (bottles.override { removeWarningPopup = true; })
      (discord.override { withOpenASAR = true; })
    ]);

}
