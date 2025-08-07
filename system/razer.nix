{ pkgs, ... }:

{

  hardware.openrazer.enable = true;

  environment.systemPackages = with pkgs; [
    razer-cli
    xrdb
  ];

  users.users.iburley = { extraGroups = [ "openrazer" ]; };

}
