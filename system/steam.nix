{ pkgs, ... }:

{

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

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

  programs.gamescope = {
    enable = true;
    args = [
      "-W 1920"
      "-H 1080"
      "-r 144"
      "-f"
      "--force-grab-cursor"
      "--immediate-flips"
      "--rt"
      "--expose-wayland"
    ];
  };

  programs.steam.enable = true;

  users.users.iburley = { extraGroups = [ "gamemode" ]; };

}
