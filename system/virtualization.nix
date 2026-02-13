{

  virtualisation = {

    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };
    spiceUSBRedirection.enable = true;

    #containers.enable = true;
    #podman = {
    #  enable = true;
    #  dockerCompat = true;
    #  defaultNetwork.settings.dns_enabled = true;
    #};

  };

  users.users.iburley = {
    extraGroups = [
      "libvirtd"
      "podman"
    ];
  };

}
