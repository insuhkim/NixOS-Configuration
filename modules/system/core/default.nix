{ self, ... }:
{
  flake.nixosModules.core = _: {
    imports = with self.nixosModules; [
      boot
      locale
      nix
      user
      variables
    ];
  };
}
