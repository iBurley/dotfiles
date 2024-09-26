{ config, lib, pkgs, pkgs-unstable, ... }:

{

  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = true;
    loader.timeout = 0;
    tmp.cleanOnBoot = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };
  services.gnome.core-utilities.enable = false;

  programs = {
    gamemode = {
      enable = true;
      settings = {
        general = {
          defaultgov = "balanced";
          desiredgov = "performance";
          renice = 10;
        };
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 1;
          amd_performance_level = "high";
        };
      };
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam.enable = true;
  };

  services.printing.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  # Workaround to get UEFI working in GNOME Boxes
  # Hopefully temporary
  systemd.tmpfiles.rules =
  let
    firmware =
      pkgs.runCommandLocal "qemu-firmware" { } ''
        mkdir $out
        cp ${pkgs.qemu}/share/qemu/firmware/*.json $out
        substituteInPlace $out/*.json --replace ${pkgs.qemu} /run/current-system/sw
      '';
  in
  [ "L+ /var/lib/qemu/firmware - - - - ${firmware}" ];

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.iburley = {
    description = "iBurley";
    extraGroups = [ "gamemode" "libvirtd" "networkmanager" "wheel" ];
    isNormalUser = true;
  };

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";

}
