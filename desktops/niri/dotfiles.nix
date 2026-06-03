{ config, lib, ... }:

{

  config = lib.mkIf config.desktops.niri.enable {

    home-manager.users.iburley =
      { ... }:

      {
        xdg.configFile = {
          "foot".source = ../../dotfiles/foot;
          "fuzzel".source = ../../dotfiles/fuzzel;
          "niri".source = ../../dotfiles/niri;
          "yazi".source = ../../dotfiles/yazi;
        };
      };

  };

}
