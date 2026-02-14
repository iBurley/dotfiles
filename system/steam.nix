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
        defaultgov = "schedutil";
        desiredgov = "performance";
        renice = 10;
        softrealtime = "auto";
      };
      cpu.pin_cores = "yes";
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

  users.users.iburley.extraGroups = [ "gamemode" ];

}
