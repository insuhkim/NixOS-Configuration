{ self, ... }:
{
  flake.nixosModules.systems = _: {
    imports = with self.nixosModules; [
      core
      audio
      bluetooth
      power
      kmscon
      tailscale
      ttyd
      openssh
    ];
  };
}
