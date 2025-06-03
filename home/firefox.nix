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
        default = "google";
        engines = {
          "amazondotcom-us".metaData.hidden = true;
          "archwiki" = {
            definedAliases = [ "@aw" ];
            urls = [{ template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; }];
          };
          "bing".metaData.hidden = true;
          "ddg".metaData.hidden = true;
          "ebay".metaData.hidden = true;
          "flathub" = {
            definedAliases = [ "@fh" ];
            urls = [{ template = "https://flathub.org/apps/search?q={searchTerms}"; }];
          };
          "github" = {
            definedAliases = [ "@gh" ];
            urls = [{ template = "https://github.com/search?q={searchTerms}"; }];
          };
          "githubnix" = {
            definedAliases = [ "@gn" ];
            urls = [{ template = "https://github.com/search?q=language%3ANix+NOT+is%3Afork+{searchTerms}&type=code"; }];
          };
          "google".metaData.hidden = true;
          "homemanager" = {
            definedAliases = [ "@hm" ];
            urls = [{ template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=release-25.05"; }];
          };
          "nixopts" = {
            definedAliases = [ "@no" ];
            urls = [{ template = "https://search.nixos.org/options?channel=25.05&query={searchTerms}"; }];
          };
          "nixpkgs" = {
            definedAliases = [ "@np" ];
            urls = [{ template = "https://search.nixos.org/packages?channel=25.05&query={searchTerms}"; }];
          };
          "nixoswiki" = {
            definedAliases = [ "@nw" ];
            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
          };
          "protondb" = {
            definedAliases = [ "@pd" ];
            urls = [{ template = "https://www.protondb.com/search?q={searchTerms}"; }];
          };
          "reddit" = {
            definedAliases = [ "@rd" ];
            urls = [{ template = "https://www.reddit.com/search/?q={searchTerms}"; }];
          };
          "stackoverflow" = {
            definedAliases = [ "@so" ];
            urls = [{ template = "https://stackoverflow.com/search?q={searchTerms}"; }];
          };
          "wikipedia".metaData.alias = "@wk";
          "youtube" = {
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
    };
  };

}
