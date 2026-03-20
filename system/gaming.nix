{ pkgs, ... }:

{

  # environment.systemPackages = with pkgs; [
  #   openrazer-daemon
  #   razer-cli
  # ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    # openrazer.enable = true;
  };

  programs.gamemode = {
    enable = true;
    settings = {
      cpu.pin_cores = "yes";
      # custom = {
      #   start = "razer-cli --poll 8000"; - 8000hz not working
      #   end = "razer-cli --poll 500";
      # };
      general = {
        defaultgov = "schedutil";
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
      "--fullscreen"
      "--expose-wayland"
      "--backend=sdl"
      "--force-grab-cursor"
      "--immediate-flips"
      "--rt"
    ];
  };

  programs.steam = {
    enable = true;
    extraPackages = with pkgs; [
      gamemode
      gamescope
    ];
  };

  users.users.iburley.extraGroups = [
    "gamemode"
    # "openrazer"
  ];

}
