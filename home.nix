{ config, lib, pkgs, pkgs-unstable, ... }:

{

  home.username = "iburley";
  home.homeDirectory = "/home/iburley";

  home.packages = (with pkgs; [
    discord
    epiphany
    evince
    ffmpeg
    fragments
    gnome-console
    gnome-text-editor
    gnome.gnome-boxes
    gnome.gnome-calculator
    gnome.gnome-calendar
    gnome.gnome-clocks
    gnome.gnome-disk-utility
    gnome.gnome-font-viewer
    gnome.gnome-logs
    gnome.gnome-music
    gnome.gnome-system-monitor
    gnome.file-roller
    gnome.nautilus
    gnome.simple-scan
    libreoffice
    loupe
    mousai
    newsflash
    prismlauncher
    spotify
    tree
    vim
    xclip
    yt-dlp
  ]) ++ (with pkgs-unstable; [
    # unstable packages here
  ]);

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
    XKB_DEFAULT_LAYOUT = "us";
  };

  xdg.configFile."user-dirs.dirs".force = true;
  xdg.userDirs = {
    enable = true;
    music = "/mnt/Storage/Music";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      cp = "cp -iv";
      ls = "ls -A --group-directories-first";
      mv = "mv -iv";
      rm = "rm -iv";
      xcopy = "xclip -i -selection clipboard";
      xpaste = "xclip -o -selection clipboard";
      yt-mp3 = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --output '%(title)s.%(ext)s'";
    };
    initExtra = ''
      yt-clip () {
        yt-dlp -f "bv*[height<=1080]+ba/b" --download-sections "*$1-$2" --force-keyframes-at-cuts $3 -q --no-warnings -P '~/Videos' -o 'Clip - %(title)s.%(ext)s' --remux-video mp4
      }
    '';
  };

  programs.firefox = {
    enable = true;
    policies = {
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      SearchBar = "separate";
      ExtensionSettings = {
        # Adguard
        "adguardadblocker@adguard.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/adguard-adblocker/latest.xpi";
          installation_mode = "normal_installed";
        };
        #Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "normal_installed";
        };
      };
      Preferences = { 
        "layers.acceleration.force-enabled" = true;
        "media.hardware-video-decoding.force-enabled" = true;
        "browser.compactmode.show" = true;
        "browser.uidensity" = 1;
      };
    };
  };

  programs.mpv = {
    enable = true;
    config = {
      profile = "high-quality";
      vo = "gpu-next";
      gpu-api = "vulkan";
      hwdec = "vulkan-copy";
      blend-subtitles = "yes";
      video-sync = "display-resample";
      interpolation = "yes";
      tscale = "oversample";
      volume = "50";
      volume-max = "200";
      alang = "en, eng, english";
      slang = "en, eng, english";
      screenshot-format = "png";
      screenshot-png-compression = "1";
      screenshot-template = "~/Pictures/%F - %p";
      ytdl-format = "bv*+ba/b";
      keep-open = "yes";
      save-position-on-quit = "yes";
    };
  };

  dconf.settings = {
    "org/gnome/TextEditor" = {
      auto-indent = true;
      highlight-current-line = true;
      indent-style = "space";
      show-grid = false;
      show-line-numbers = true;
      show-map = true;
      show-right-margin = false;
      tab-width = lib.hm.gvariant.mkUint32 2;
      use-system-font = true;
    };
    "org/gnome/desktop/app-folders/folders/Office" = {
      apps = [ 
        "startcenter.desktop"
        "base.desktop"
        "calc.desktop"
        "draw.desktop"
        "impress.desktop"
        "math.desktop"
        "writer.desktop" 
      ];
      name = "Office";
    };
    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ 
        "org.gnome.DiskUtility.desktop"
        "org.gnome.Evince.desktop"
        "org.gnome.Extensions.desktop"
        "org.gnome.FileRoller.desktop"
        "org.gnome.font-viewer.desktop"
        "org.gnome.Loupe.desktop"
        "org.gnome.Logs.desktop"
        "nixos-manual.desktop"
        "cups.desktop"
        "org.gnome.Tour.desktop"
      ];
      categories = [ "X-GNOME-Utilities" ];
      excluded-apps = [ "org.gnome.Console.desktop" ];
      name = "X-GNOME-Utilities.directory";
    };
    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      font-antialiasing = "rgba";
      monospace-font-name = "Source Code Pro Semi-Bold 10";
    };
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };
    "org/gnome/desktop/privacy" = {
      remember-recent-files = false;
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };
    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "small-plus";
    };
    "org/gnome/shell" = {
      #app-picker-layout = []; # placeholder
      disable-user-extensions = true;
      favorite-apps = [
        "firefox.desktop"
        "discord.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
      ];
    };
  };

  home.stateVersion = "24.05";

}
