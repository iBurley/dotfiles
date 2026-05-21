{ pkgs, pkgs-unstable, ... }:

{

  environment.systemPackages =
    (with pkgs; [
      ffmpeg
      file-roller
      fragments
      glow
      gnome-boxes
      imagemagick
      jq
      libnotify
      libreoffice
      newsflash
      prismlauncher
      spotify
      wl-clipboard
      yt-dlp
    ])
    ++ (with pkgs-unstable; [
      # (bottles.override { removeWarningPopup = true; })
      (discord.override { withOpenASAR = true; })
    ]);

}
