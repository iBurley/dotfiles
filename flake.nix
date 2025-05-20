{

  description = "NixOS Configuration";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nautilus-scripts = {
      url = "github:iBurley/nautilus-scripts";
      flake = false;
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, home-manager, nautilus-scripts, nixpkgs, nixpkgs-unstable, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./system/configuration.nix
            home-manager.nixosModules.home-manager {
              nixpkgs.pkgs = pkgs;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.iburley = import ./home/home.nix;
              home-manager.extraSpecialArgs = {
                inherit nautilus-scripts pkgs-unstable;
              };
            }
          ];
        };
      };
    };

}
