{ inputs, ... }:
let
  system = "x86_64-linux";
  userName = "insuhkim";
in
{
  flake.homeConfigurations = {
    ${userName} = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      extraSpecialArgs = { inherit inputs userName; };
      modules = [ ./_home ];
    };
  };
}
