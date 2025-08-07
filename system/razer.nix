{ pkgs, ... }:

{

  hardware.openrazer.enable = true;

  environment.systemPackages = with pkgs; [
    razer-cli
    xorg.xrdb
  ];

  users.users.iburley = { extraGroups = [ "openrazer" ]; };

}
