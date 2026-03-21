{ lib, ... }:

{

  dconf.settings = {
    "org/gnome/desktop/app-folders" = {
      folder-children = [
        "Office"
        "Utilities"
      ];
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
        "org.gnome.Papers.desktop"
        "org.gnome.Extensions.desktop"
        "org.gnome.FileRoller.desktop"
        "org.gnome.font-viewer.desktop"
        "org.gnome.Loupe.desktop"
        "org.gnome.Logs.desktop"
        "cups.desktop"
        "nixos-manual.desktop"
      ];
      name = "Utilities";
    };
    "org/gnome/desktop/interface" = {
      accent-color = "blue";
      clock-format = "12h";
      clock-show-weekday = true;
      color-scheme = "prefer-dark";
      font-antialiasing = "rgba";
      font-hinting = "slight";
      monospace-font-name = "JetBrainsMono Nerd Font Mono Medium 11";
    };
    "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
    "org/gnome/desktop/privacy".remember-recent-files = false;
    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [ ];
      begin-move = [ ];
      begin-resize = [ ];
      cycle-group = [ ];
      cycle-group-backward = [ ];
      cycle-panels = [ ];
      cycle-panels-backward = [ ];
      cycle-windows = [ ];
      cycle-windows-backward = [ ];
      minimize = [ ];
      move-to-workspace-1 = [ ];
      move-to-workspace-last = [ ];
      switch-group = [ ];
      switch-group-backward = [ ];
      switch-input-source = [ ];
      switch-input-source-backward = [ ];
      switch-panels = [ ];
      switch-panels-backward = [ ];
      switch-to-workspace-1 = [ ];
      switch-to-workspace-last = [ ];
      toggle-maximized = [ ];
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };
    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [ ];
    };
    "org/gnome/nautilus/icon-view".default-zoom-level = "small-plus";
    "org/gnome/settings-daemon/plugins/media-keys" = {
      help = [ ];
      magnifier = [ ];
      magnifier-zoom-in = [ ];
      magnifier-zoom-out = [ ];
      screenreader = [ ];
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
    "org/gnome/shell/keybindings" = {
      focus-active-notification = [ ];
      screenshot = [ ];
      screenshot-window = [ ];
      toggle-application-view = [ ];
      toggle-message-tray = [ ];
      toggle-quick-settings = [ ];
    };
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
