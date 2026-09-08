{
  description = "Insuh's NixOS configuration";

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      system = "x86_64-linux";
      userName = "insuhkim";

      mkHost =
        hostPath:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs userName; };
          modules = [
            hostPath
            ./hosts/common.nix
          ];
        };

      mkHome =
        homePath:
        inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          extraSpecialArgs = { inherit inputs userName; };
          modules = [
            homePath
          ];
        };

    in
    {
      nixosConfigurations = {
        yoga = mkHost ./hosts/lenovo-yoga;
        old-laptop = mkHost ./hosts/old-laptop;
      };
      homeConfigurations = {
        ${userName} = mkHome ./home;
        "${userName}@yoga" = mkHome ./home;
        "${userName}@old-laptop" = mkHome ./home;
      };
    };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";

    home-manager-stable.url = "github:nix-community/home-manager/release-25.05";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
  };
}
