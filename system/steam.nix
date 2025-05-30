{

  hardware.graphics.enable32Bit = true;

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
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

  programs.gamescope.enable = true;

  programs.steam.enable = true;

  users.users.iburley = { extraGroups = [ "gamemode" ]; };

}
