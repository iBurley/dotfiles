{

  programs.gamemode = {
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

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.steam.enable = true;

}
