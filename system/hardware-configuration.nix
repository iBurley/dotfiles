{ config, lib, pkgs, modulesPath, ... }:

{

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    extraModulePackages = [ ];
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ece2361d-660c-4e0b-8c62-b5317705ec02";
    fsType = "ext4";
    options = [ "discard" "noatime" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3ACB-F43E";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" "discard" "noatime" ];
  };

  fileSystems."/mnt/Storage" = {
    device = "/dev/disk/by-uuid/05044ab0-bb11-47ff-b2f3-881d3bc4ac09";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  fileSystems."/mnt/Games" = {
    device = "/dev/disk/by-uuid/a9e88f8e-0fab-47eb-a095-43c1aa17dfb6";
    fsType = "ext4";
    options = [ "discard" "noatime" ];
  };

  swapDevices = [ ];

  services.fstrim.enable = true;

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
