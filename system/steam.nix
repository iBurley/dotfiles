{

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        defaultgov = "schedutil";
        desiredgov = "performance";
        renice = 10;
        softrealtime = "auto";
      };
      cpu = {
        pin_cores = "yes";
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 1;
        amd_performance_level = "high";
      };
    };
  };

  programs.gamescope = {
    enable = true;
    args = [
      "-W 1920"
      "-H 1080"
      "-r 144"
      "-f"
      "--expose-wayland"
      "--force-grab-cursor"
      "--hdr-enabled"
      "--hdr-itm-enable"
      "--immediate-flips"
      "--rt"
    ];
  };

  programs.steam.enable = true;

  users.users.iburley = {
    extraGroups = [ "gamemode" ];
  };

}
