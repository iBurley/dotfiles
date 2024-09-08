{ config, lib, pkgs, modulesPath, ... }:

{

  imports = [ 
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "sd_mod" ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
  };

  fileSystems."/" = { 
    device = "/dev/disk/by-uuid/ece2361d-660c-4e0b-8c62-b5317705ec02";
    fsType = "ext4";
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/3ACB-F43E";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/mnt/Storage" = { 
    device = "/dev/disk/by-uuid/05044ab0-bb11-47ff-b2f3-881d3bc4ac09";
    fsType = "ext4";
  };

  fileSystems."/mnt/Games" = { 
    device = "/dev/disk/by-uuid/a9e88f8e-0fab-47eb-a095-43c1aa17dfb6";
    fsType = "ext4";
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}
