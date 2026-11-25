{ self, inputs, ... }:
let
  userName = "insuhkim";
in
{
  flake.nixosConfigurations.old-laptop = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs userName; };
    modules = with self.nixosModules; [
      gui
      cli
      mango
      fcitx5
      systems
      old-laptopConfiguration
    ];
  };
}
