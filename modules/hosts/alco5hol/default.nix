{ self, inputs, ... }:
let
  userName = "insuhkim";
in
{
  flake.nixosConfigurations.alco5hol = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs userName; };
    modules = with self.nixosModules; [
      gui
      cli
      mango
      fcitx5
      systems
      alco5hol-configuration
    ];
  };
}
