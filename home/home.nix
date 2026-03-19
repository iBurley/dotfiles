{

  imports = [
    ./dconf.nix
    ./mpv.nix
    ./neovim.nix
    ./zed-editor.nix
  ];

  home.username = "iburley";
  home.homeDirectory = "/home/iburley";

  home.file.".local/share/nautilus/scripts/" = {
    source = ../files/nautilus-scripts;
    recursive = true;
  };

  xdg.configFile."user-dirs.dirs".force = true;
  xdg.userDirs = {
    enable = true;
    music = "/mnt/Storage/Music";
  };

  home.stateVersion = "24.05";

}
