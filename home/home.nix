{

  imports = [
    ./dconf.nix
    ./firefox.nix
    ./mpv.nix
    ./nautilus-scripts.nix
    ./neovim.nix
    ./packages.nix
    ./zed-editor.nix
  ];

  home.username = "iburley";
  home.homeDirectory = "/home/iburley";

  xdg.configFile."user-dirs.dirs".force = true;
  xdg.userDirs = {
    enable = true;
    music = "/mnt/Storage/Music";
  };

  home.stateVersion = "24.05";

}
