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

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  users.users.iburley = {
    extraGroups = [
      "libvirtd"
      "podman"
    ];
  };

}
