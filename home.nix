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
    imagemagick
    libnotify
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

  home.file = let
    nautilus-scripts = pkgs.fetchFromGitHub {
      owner = "iBurley";
      repo = "nautilus-scripts";
      rev = "main";
      sha256 = "sha256-fHJrLbLIDWmNZAg5xkmWcK3shLc0pjtdfz6PKus10DA=";
    }; in {
    ".local/share/nautilus/scripts/Convert to GIF" = {
      source = "${nautilus-scripts}/convert-to-gif";
      executable = true;
    };
    ".local/share/nautilus/scripts/Convert to JPG" = {
      source = "${nautilus-scripts}/convert-to-jpg";
      executable = true;
    };
    ".local/share/nautilus/scripts/Convert to MP3" = {
      source = "${nautilus-scripts}/convert-to-mp3";
      executable = true;
    };
    ".local/share/nautilus/scripts/Convert to MP4" = {
      source = "${nautilus-scripts}/convert-to-mp4";
      executable = true;
    };
    ".local/share/nautilus/scripts/Convert to PDF" = {
      source = "${nautilus-scripts}/convert-to-pdf";
      executable = true;
    };
    ".local/share/nautilus/scripts/Convert to PNG" = {
      source = "${nautilus-scripts}/convert-to-png";
      executable = true;
    };
    ".local/share/nautilus/scripts/Upload to Imgur" = {
      source = "${nautilus-scripts}/upload-to-imgur";
      executable = true;
    };
    ".local/share/nautilus/scripts/Upload to Pastebin" = {
      source = "${nautilus-scripts}/upload-to-pastebin";
      executable = true;
    };
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
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      Cookies.Behavior = "reject-tracker-and-partition-foreign";
      DisableBuiltinPDFViewer = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisableMasterPasswordCreation = true;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      EnableTrackingProtection = {
        Cryptomining = true;
        Fingerprinting = true;
        Value = true;
      };
      EncryptedMediaExtensions.Enabled = true;
      Extensions.Install = [
        "https://addons.mozilla.org/firefox/downloads/latest/adguard-adblocker/latest.xpi"
        "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi"
      ];
      FirefoxHome = {
        Highlights = false;
        Pocket = false;
        Search = false;
        Snippets = false;
        SponsoredPocket = false;
        SponsoredTopSites = false;
        TopSites = true;
      };
      FirefoxSuggest = {
        ImproveSuggest = false;
        SponsoredSuggestions = false;
        WebSuggestions = false;
      };
      HardwareAcceleration = true;
      HttpsOnlyMode = "enabled";
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      PasswordManagerEnabled = false;
      Permissions = {
        Autoplay.Default = "block-audio";
        Camera.BlockNewRequests = true;
        Location.BlockNewRequests = true;
        Microphone.BlockNewRequests = true;
        Notifications.BlockNewRequests = true;
        VirtualReality.BlockNewRequests = true;
      };
      PictureInPicture.Enabled = true;
      PopupBlocking.Default = true;
      PrimaryPassword = false;
      RequestedLocales = "en-US";
      SearchBar = "unified";
      SearchSuggestEnabled = false;
      ShowHomeButton = true;
      TranslateEnabled = true;
    };
    profiles.iBurley = {
      search = {
        default = "Google";
        engines = {
          "Arch Wiki" = {
            definedAliases = [ "@aw" ];
            urls = [{ template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; }];
          };
          "GitHub" = {
            definedAliases = [ "@gh" ];
            urls = [{ template = "https://github.com/search?q={searchTerms}"; }];
          };
          "Home Manager" = {
            definedAliases = [ "@hm" ];
            urls = [{ template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=release-24.05"; }];
          };
          "NixOS Options" = {
            definedAliases = [ "@no" ];
            urls = [{ template = "https://search.nixos.org/options?channel=24.05&query={searchTerms}"; }];
          };
          "NixOS Packages" = {
            definedAliases = [ "@np" ];
            urls = [{ template = "https://search.nixos.org/packages?channel=24.05&query={searchTerms}"; }];
          };
          "YouTube" = {
            definedAliases = [ "@yt" ];
            urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
          };
        };
        force = true;
      };
      settings = {
        "browser.compactmode.show" = true;
        "browser.newtabpage.pinned" = [
          { title = "Reddit"; url = "https://Reddit.com"; }
          { title = "YouTube"; url = "https://youtube.com/feed/subscriptions"; }
          { title = "Twitch"; url = "https://twitch.tv/directory/following/live"; }
          { title = "GitHub"; url = "https://github.com"; }
          { title = "Email"; url = "https://outlook.live.com"; }
        ];
        "browser.uidensity" = 1;
        "general.autoScroll" = true;
        "layers.acceleration.force-enabled" = true;
        "media.hardware-video-decoding.force-enabled" = true;
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
    scripts = with pkgs.mpvScripts; [
      inhibit-gnome
      mpris
    ];
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
      name = "Utilities";
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
    "org/gtk/gtk4/settings/file-chooser" = {
      sort-column = "modified";
      sort-directories-first = true;
      sort-order = "descending";
    };
    "org/gtk/settings/file-chooser" = {
      sort-column = "modified";
      sort-directories-first = true;
      sort-order = "descending";
    };
  };

  home.stateVersion = "24.05";

}
