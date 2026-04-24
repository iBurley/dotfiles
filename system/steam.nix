{

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.gamemode = {
    enable = true;
    settings = {
      cpu.pin_cores = "yes";
      general = {
        desiredgov = "performance";
        renice = 10;
        softrealtime = "auto";
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
      "--output-width 1920"
      "--output-height 1080"
      "--nested-refresh 144"
      "--expose-wayland"
      "--backend=sdl"
      # "--rt" # needs capSysNice
      "--fullscreen"
      "--force-grab-cursor"
      "--immediate-flips"
    ];
    # capSysNice = true; # broken currently
    env.SDL_VIDEODRIVER = "x11";
  };

  programs.steam.enable = true;

  users.users.iburley.extraGroups = [
    "gamemode"
  ];

}
