{
  config,
  lib,
  modulesPath,
  ...
}:

{

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    extraModulePackages = [ ];
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "ahci"
      "usbhid"
      "usb_storage"
      "sd_mod"
    ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/b02d86ac-075e-4831-902b-4814efb38f2a";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D4F0-0F45";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
      "noatime"
    ];
  };

  fileSystems."/mnt/Storage" = {
    device = "/dev/disk/by-uuid/05044ab0-bb11-47ff-b2f3-881d3bc4ac09";
    fsType = "ext4";
    options = [
      "noatime"
      "nofail"
    ];
  };

  fileSystems."/mnt/Games" = {
    device = "/dev/disk/by-uuid/a9e88f8e-0fab-47eb-a095-43c1aa17dfb6";
    fsType = "ext4";
    options = [
      "noatime"
      "noauto"
      "nofail"
      "x-systemd.automount"
    ];
  };

  swapDevices = [ ];

  services.fstrim.enable = true;

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
