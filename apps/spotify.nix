{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{

  options.apps.spotify.enable = lib.mkEnableOption "Spotify";

  config = lib.mkIf config.apps.spotify.enable {

    programs.spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        aiBandBlocker
        autoSkipVideo
      ];
      theme = spicePkgs.themes.default;
    };

  };

}
