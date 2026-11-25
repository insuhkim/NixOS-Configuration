{ self, ... }:
{
  flake.nixosModules.desktop = _: {
    imports = with self.nixosModules; [
      mango
      noctalia
      fcitx5
      fonts
    ];
  };
}
