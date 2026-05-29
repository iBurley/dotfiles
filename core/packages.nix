{ pkgs, pkgs-unstable, ... }:

{

  environment.systemPackages =
    (with pkgs; [
      ffmpeg
      imagemagick
      libnotify
      libreoffice
      prismlauncher
      wl-clipboard
      yt-dlp
    ])
    ++ (with pkgs-unstable; [
      (discord.override { withOpenASAR = true; })
    ]);

}
