{ pkgs, ... }:

{

  virtualisation = {
    libvirtd.enable = true;
    libvirtd.qemu = {
      ovmf.packages = [ pkgs.OVMFFull.fd ];
      swtpm.enable = true;
    };
    spiceUSBRedirection.enable = true;
  };

  users.users.iburley = {
    extraGroups = [ "libvirtd" ];
  };

}
