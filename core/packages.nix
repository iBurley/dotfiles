{ pkgs, pkgs-unstable, ... }:

{

  environment.systemPackages =
    (with pkgs; [
      discord
      ffmpeg
      imagemagick
      libnotify
      libreoffice
      prismlauncher
      wl-clipboard
      yt-dlp
    ])
    ++ (with pkgs-unstable; [
      # unstable packages
    ]);

}
