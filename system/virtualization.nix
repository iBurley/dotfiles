{ pkgs, ... }:

{

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  users.users.iburley = { extraGroups = [ "libvirtd" ]; };

}
