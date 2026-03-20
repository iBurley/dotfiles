{ pkgs-unstable, ... }:

{

  programs.mpv = {
    enable = true;
    config = {
      alang = "en, eng, english";
      blend-subtitles = "yes";
      cscale = "ewa_lanczossharp";
      deband-grain = "5";
      deband-iterations = "2";
      deband-range = "16";
      deband-threshold = "35";
      gpu-api = "vulkan";
      gpu-context = "waylandvk";
      hdr-compute-peak = "yes";
      hwdec = "vulkan";
      interpolation = "yes";
      keep-open = "yes";
      profile = "high-quality";
      save-position-on-quit = "yes";
      screenshot-format = "png";
      screenshot-high-bit-depth = "yes";
      screenshot-png-compression = "1";
      screenshot-template = "~/Pictures/%F - %p";
      slang = "en, eng, english";
      target-colorspace-hint = "yes";
      tone-mapping = "bt.2390";
      tscale = "mitchell";
      video-sync = "display-resample";
      vo = "gpu-next";
      volume = "50";
      volume-max = "200";
      vulkan-async-compute = "yes";
      vulkan-async-transfer = "yes";
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
