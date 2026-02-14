{

  imports = [
    ./dconf.nix
    ./firefox.nix
    ./mpv.nix
    ./neovim.nix
    ./packages.nix
    ./zed-editor.nix
  ];

  home.username = "iburley";
  home.homeDirectory = "/home/iburley";

  home.file = {
    ".local/share/nautilus/scripts/Convert to GIF".source = ../files/nautilus-scripts/convert-to-gif.sh;
    ".local/share/nautilus/scripts/Convert to JPG".source = ../files/nautilus-scripts/convert-to-jpg.sh;
    ".local/share/nautilus/scripts/Convert to MP3".source = ../files/nautilus-scripts/convert-to-mp3.sh;
    ".local/share/nautilus/scripts/Convert to MP4".source = ../files/nautilus-scripts/convert-to-mp4.sh;
    ".local/share/nautilus/scripts/Convert to PDF".source = ../files/nautilus-scripts/convert-to-pdf.sh;
    ".local/share/nautilus/scripts/Convert to PNG".source = ../files/nautilus-scripts/convert-to-png.sh;
    ".local/share/nautilus/scripts/Upload to Imgur".source =
      ../files/nautilus-scripts/upload-to-imgur.sh;
    ".local/share/nautilus/scripts/Upload to Pastebin".source =
      ../files/nautilus-scripts/upload-to-pastebin.sh;
  };

  programs.git = {
    enable = true;
    settings = {
      init = {
        credential.helper = "store";
        defaultBranch = "main";
        ignores = [ "*.env" ];
      };
      user.email = "10081177+iBurley@users.noreply.github.com";
      user.name = "iBurley";
    };
  };

  xdg.configFile."user-dirs.dirs".force = true;
  xdg.userDirs = {
    enable = true;
    music = "/mnt/Storage/Music";
  };

  home.stateVersion = "24.05";

}
