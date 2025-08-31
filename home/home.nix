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

  programs.git = {
    enable = true;
    extraConfig.init = {
      credential.helper = "store";
      defaultBranch = "main";
      ignores = [ "*.env" ];
    };
    userEmail = "10081177+iBurley@users.noreply.github.com";
    userName = "iBurley";
  };

  xdg.configFile."user-dirs.dirs".force = true;
  xdg.userDirs = {
    enable = true;
    music = "/mnt/Storage/Music";
  };

  home.stateVersion = "24.05";

}
