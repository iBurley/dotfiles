{ lib, ... }:

{

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

}
