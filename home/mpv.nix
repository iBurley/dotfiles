{ pkgs-unstable, ... }:

{

  programs.mpv = {
    enable = true;
    config = {
      alang = "en, eng, english";
      blend-subtitles = "yes";
      gpu-api = "vulkan";
      hwdec = "vulkan-copy";
      interpolation = "yes";
      keep-open = "yes";
      profile = "high-quality";
      save-position-on-quit = "yes";
      screenshot-format = "png";
      screenshot-png-compression = "1";
      screenshot-template = "~/Pictures/%F - %p";
      slang = "en, eng, english";
      tscale = "oversample";
      video-sync = "display-resample";
      vo = "gpu-next";
      volume = "50";
      volume-max = "200";
      ytdl-format = "bv*+ba/b";
    };
    package = pkgs-unstable.celluloid;
  };

  dconf.settings = {
    "io/github/celluloid-player/celluloid" = {
      always-show-title-buttons = false;
      always-use-floating-controls = true;
      always-use-floating-header-bar = true;
      autofit-enable = true;
      csd-enable = true;
      draggable-video-area-enable = true;
      mpv-config-enable = true;
      mpv-config-file = "file:///home/iburley/.config/mpv/mpv.conf";
    };
  };

}
