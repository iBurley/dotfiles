{
  config,
  lib,
  pkgs,
  ...
}:

{

  imports = [
    #
  ];

  options.desktops.niri.enable = lib.mkEnableOption "Niri Window Manager";

  config = lib.mkIf config.desktops.niri.enable {

    environment.systemPackages = with pkgs; [
      foot
      fuzzel
      mako
      swayidle
      swaylock
      xwayland-satellite
      yazi
    ];

    programs.niri.enable = true;

  };

}
