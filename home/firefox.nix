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
        "https://addons.mozilla.org/firefox/downloads/latest/youtube_auto_like/latest.xpi"
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
          "Amazon.com".metaData.hidden = true;
          "Arch Wiki" = {
            definedAliases = [ "@aw" ];
            urls = [{ template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; }];
          };
          "Bing".metaData.hidden = true;
          "DuckDuckGo".metaData.hidden = true;
          "eBay".metaData.hidden = true;
          "Flathub" = {
            definedAliases = [ "@fh" ];
            urls = [{ template = "https://flathub.org/apps/search?q={searchTerms}"; }];
          };
          "GitHub" = {
            definedAliases = [ "@gh" ];
            urls = [{ template = "https://github.com/search?q={searchTerms}"; }];
          };
          "GitHub Nix Config" = {
            definedAliases = [ "@gn" ];
            urls = [{ template = "https://github.com/search?q=language%3ANix+NOT+is%3Afork+{searchTerms}&type=code"; }];
          };
          "Google".metaData.hidden = true;
          "Home Manager" = {
            definedAliases = [ "@hm" ];
            urls = [{ template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=release-24.05"; }];
          };
          "NixOS Options" = {
            definedAliases = [ "@no" ];
            urls = [{ template = "https://search.nixos.org/options?channel=24.11&query={searchTerms}"; }];
          };
          "NixOS Packages" = {
            definedAliases = [ "@np" ];
            urls = [{ template = "https://search.nixos.org/packages?channel=24.11&query={searchTerms}"; }];
          };
          "NixOS Wiki" = {
            definedAliases = [ "@nw" ];
            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
          };
          "ProtonDB" = {
            definedAliases = [ "@pd" ];
            urls = [{ template = "https://www.protondb.com/search?q={searchTerms}"; }];
          };
          "Reddit" = {
            definedAliases = [ "@rd" ];
            urls = [{ template = "https://www.reddit.com/search/?q={searchTerms}"; }];
          };
          "Stack Overflow" = {
            definedAliases = [ "@so" ];
            urls = [{ template = "https://stackoverflow.com/search?q={searchTerms}"; }];
          };
          "Wikipedia (en)".metaData.alias = "@wk";
          "YouTube" = {
            definedAliases = [ "@yt" ];
            urls = [{ template = "https://www.youtube.com/results?search_query={searchTerms}"; }];
          };
        };
        force = true;
      };
      settings = {
        "browser.compactmode.show" = true;
        "browser.newtabpage.activity-stream.system.showWeather" = false;
        "browser.newtabpage.activity-stream.topSitesRows" = 2;
        "browser.newtabpage.pinned" = [
          { label = "Reddit"; url = "https://Reddit.com"; }
          { label = "YouTube"; url = "https://youtube.com/feed/subscriptions"; }
          { label = "Twitch"; url = "https://twitch.tv/directory/following/live"; }
          { label = "GitHub"; url = "https://github.com"; }
          { label = "Email"; url = "https://outlook.live.com"; }
        ];
        "browser.uidensity" = 1;
        "general.autoScroll" = true;
        "layers.acceleration.force-enabled" = true;
        "media.hardware-video-decoding.force-enabled" = true;
      };
    };
  };

}
