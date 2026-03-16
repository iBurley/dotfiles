{

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
      DisableProfileImport = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      DNSOverHTTPS.Enabled = false;
      EnableTrackingProtection = {
        Category = "strict";
        Cryptomining = true;
        EmailTracking = true;
        Fingerprinting = true;
        SuspectedFingerprinting = true;
        Value = true;
      };
      EncryptedMediaExtensions.Enabled = true;
      ExtensionSettings = {
        "adguardadblocker@adguard.com" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/adguard-adblocker/latest.xpi";
          private_browsing = true;
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          private_browsing = true;
        };
        "sponsorBlocker@ajay.app" = {
          default_area = "menupanel";
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
        };
        "{21b3b6ae-1582-4db8-84b3-b6cc45a4a92c}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube_auto_like/latest.xpi";
        };
      };
      FirefoxHome = {
        Highlights = false;
        Search = false;
        SponsoredStories = false;
        SponsoredTopSites = false;
        Stories = false;
        TopSites = true;
      };
      FirefoxSuggest = {
        ImproveSuggest = false;
        SponsoredSuggestions = false;
        WebSuggestions = false;
      };
      GenerativeAI.Enabled = false;
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
        ScreenShare.BlockNewRequests = true;
        VirtualReality.BlockNewRequests = true;
      };
      PictureInPicture.Enabled = true;
      PopupBlocking.Default = true;
      Preferences = {
        "browser.compactmode.show" = true;
        "browser.newtabpage.activity-stream.system.showWeather" = false;
        "browser.newtabpage.activity-stream.topSitesRows" = 2;
        "browser.newtabpage.pinned" = builtins.toJSON [
          {
            label = "Reddit";
            url = "https://Reddit.com";
          }
          {
            label = "YouTube";
            url = "https://youtube.com/feed/subscriptions";
          }
          {
            label = "Twitch";
            url = "https://twitch.tv/directory/following/live";
          }
          {
            label = "GitHub";
            url = "https://github.com";
          }
          {
            label = "Email";
            url = "https://outlook.live.com";
          }
        ];
        "browser.tabs.firefox-view" = false;
        "browser.tabs.tabmanager.enabled" = false;
        "browser.uidensity" = 1;
        "browser.uiCustomization.state" = builtins.toJSON {
          placements = {
            nav-bar = [
              "back-button"
              "forward-button"
              "stop-reload-button"
              "home-button"
              "urlbar-container"
              "downloads-button"
              "unified-extensions-button"
            ];
            TabsToolbar = [
              "tabbrowser-tabs"
              "new-tab-button"
            ];
          };
          currentVersion = 20;
        };
        "general.autoScroll" = true;
        "layers.acceleration.force-enabled" = true;
        "media.hardware-video-decoding.force-enabled" = true;
      };
      PrimaryPassword = false;
      RequestedLocales = "en-US";
      SearchBar = "unified";
      SearchEngines.Add = [
        {
          Name = "Arch Wiki";
          Alias = "@aw";
          URLTemplate = "https://wiki.archlinux.org/index.php?search={searchTerms}";
          IconURL = "https://wiki.archlinux.org/favicon.ico";
        }
        {
          Name = "Docker Hub";
          Alias = "@dh";
          URLTemplate = "https://hub.docker.com/search?q={searchTerms}";
          IconURL = "https://hub.docker.com/favicon.ico";
        }
        {
          Name = "Flathub";
          Alias = "@fh";
          URLTemplate = "https://flathub.org/apps/search?q={searchTerms}";
          IconURL = "https://flathub.org/favicon.png";
        }
        {
          Name = "GitHub";
          Alias = "@gh";
          URLTemplate = "https://github.com/search?q={searchTerms}";
          IconURL = "https://github.com/favicon.ico";
        }
        {
          Name = "GitHub Nix";
          Alias = "@gn";
          URLTemplate = "https://github.com/search?q=language%3ANix+NOT+is%3Afork+{searchTerms}&type=code";
          IconURL = "https://github.com/favicon.ico";
        }
        {
          Name = "Home Manager";
          Alias = "@hm";
          URLTemplate = "https://home-manager-options.extranix.com/?query={searchTerms}&release=release-25.11";
          IconURL = "https://home-manager-options.extranix.com/images/favicon.png";
        }
        {
          Name = "NixOS Options";
          Alias = "@no";
          URLTemplate = "https://search.nixos.org/options?channel=25.11&query={searchTerms}";
          IconURL = "https://search.nixos.org/favicon.png";
        }
        {
          Name = "NixOS Packages";
          Alias = "@np";
          URLTemplate = "https://search.nixos.org/packages?channel=25.11&query={searchTerms}";
          IconURL = "https://search.nixos.org/favicon.png";
        }
        {
          Name = "NixOS Wiki";
          Alias = "@nw";
          URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
          IconURL = "https://wiki.nixos.org/favicon.ico";
        }
        {
          Name = "ProtonDB";
          Alias = "@pd";
          URLTemplate = "https://www.protondb.com/search?q={searchTerms}";
          IconURL = "https://www.protondb.com/favicon.ico";
        }
        {
          Name = "Reddit";
          Alias = "@rd";
          URLTemplate = "https://www.reddit.com/search/?q={searchTerms}";
          IconURL = "https://www.reddit.com/favicon.ico";
        }
        {
          Name = "Stack Overflow";
          Alias = "@so";
          URLTemplate = "https://stackoverflow.com/search?q={searchTerms}";
          IconURL = "https://stackoverflow.com/favicon.ico";
        }
        {
          Name = "Wikipedia";
          Alias = "@wk";
          URLTemplate = "https://en.wikipedia.org/wiki/Special:Search?search={searchTerms}";
          IconURL = "https://en.wikipedia.org/static/favicon/wikipedia.ico";
        }
        {
          Name = "YouTube";
          Alias = "@yt";
          URLTemplate = "https://www.youtube.com/results?search_query={searchTerms}";
          IconURL = "https://www.youtube.com/favicon.ico";
        }
      ];
      SearchEngines.Remove = [
        "Amazon.com"
        "Bing"
        "eBay"
        "Perplexity"
        "Wikipedia (en)"
      ];
      SearchSuggestEnabled = false;
      ShowHomeButton = true;
      SkipTermsOfUse = true;
      TranslateEnabled = true;
    };
  };

}
