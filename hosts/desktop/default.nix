{

  imports = [
    ./hardware.nix
    ../../apps
    ../../core
    ../../desktops
  ];

  apps.firefox.enable = true;
  apps.neovim.enable = true;
  apps.mpv.enable = true;
  apps.ollama.enable = true;
  apps.ptt.enable = true;
  apps.spotify.enable = true;
  apps.steam.enable = true;
  apps.zed.enable = true;

  desktops.gnome.enable = true;
  # desktops.niri.enable = true;

  networking.hostName = "desktop";

}
