{
  config,
  lib,
  pkgs,
  ...
}:

{

  imports = [
    ./dconf.nix
  ];

  options.desktops.gnome.enable = lib.mkEnableOption "GNOME desktop";

  config = lib.mkIf config.desktops.gnome.enable {

    environment.systemPackages = with pkgs; [
      (bottles.override { removeWarningPopup = true; })
      file-roller
      fragments
      gnome-boxes
      newsflash
    ];

    services.desktopManager.gnome.enable = true;
    services.displayManager.gdm.enable = true;
    services.geoclue2.enable = false;
    environment.gnome.excludePackages = with pkgs; [
      baobab
      decibels
      geary
      gnome-characters
      gnome-connections
      gnome-contacts
      gnome-maps
      gnome-shell-extensions
      gnome-tour
      gnome-weather
      seahorse
      showtime
      snapshot
      yelp
    ];

    qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita-dark";
    };

    home-manager.users.iburley =
      { ... }:
      {
        home.file.".local/share/nautilus/scripts/" = {
          source = ../../files/nautilus-scripts;
          recursive = true;
        };

        xdg.configFile."user-dirs.dirs".force = true;
        xdg.userDirs = {
          enable = true;
          music = "/mnt/Storage/Music";
        };
      };

  };

}
