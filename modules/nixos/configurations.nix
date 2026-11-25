{ self, inputs, ... }:
let
  system = "x86_64-linux";
  userName = "insuhkim";
in
{
  flake.nixosConfigurations.old-laptop = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs userName; };
    modules = [
      ../../hosts/old-laptop
      ../../hosts/common.nix
    ]
    ++ (with self.nixosModules; [
      gui
      cli
      starship
      git
      jujutsu
      mango
      fcitx5
      systems
    ]);
  };
}
