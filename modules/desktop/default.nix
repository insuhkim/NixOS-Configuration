{ self, ... }:
{
  flake.nixosModules.desktop = _: {
    imports = with self.nixosModules; [
      mango
      fcitx5
      fonts
    ];
  };
}
