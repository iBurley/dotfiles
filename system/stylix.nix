{ pkgs, ... }:

{

  stylix = {
    enable = true;
    image = ./wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    fonts = {
      serif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };
      sansSerif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };
      monospace = {
        name = "SauceCodePro NFM Semibold";
        package = pkgs.nerdfonts.override { fonts = [ "SourceCodePro" ]; };
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji;
      };
    };
  };

}
