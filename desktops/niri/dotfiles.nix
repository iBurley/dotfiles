{ config, lib, ... }:

{

  config = lib.mkIf config.desktops.niri.enable {

    home-manager.users.iburley =
      { ... }:

      {

        xdg.configFile = {
          "foot".source = ../../dotfiles/foot;
          "fuzzel".source = ../../dotfiles/fuzzel;
          "fuzzel/scripts/power.sh" = {
            source = ../../dotfiles/fuzzel/scripts/power.sh;
            executable = true;
          };
          "fuzzel/scripts/sound-input.sh" = {
            source = ../../dotfiles/fuzzel/scripts/sound-input.sh;
            executable = true;
          };
          "fuzzel/scripts/sound-output.sh" = {
            source = ../../dotfiles/fuzzel/scripts/sound-output.sh;
            executable = true;
          };
          "mako".source = ../../dotfiles/mako;
          "niri".source = ../../dotfiles/niri;
          "yazi".source = ../../dotfiles/yazi;
        };

      };

  };

}
