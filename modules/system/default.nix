{ self, ... }:
{
  flake.nixosModules.systems =
    { ... }:
    {
      imports = with self.nixosModules; [
        nix
        audio
        bluetooth
        boot
        power
        fonts
        kmscon
        tailscale
        ttyd
        variables
        user
      ];
    };
}
