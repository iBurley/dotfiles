{ pkgs, pkgs-unstable, ... }:

{

  environment.systemPackages =
    (with pkgs; [
      discord
      ffmpeg
      file-roller
      fragments
      gajim
      glow
      gnome-boxes
      imagemagick
      jq
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
      # (bottles.override { removeWarningPopup = true; })
    ]);

}
