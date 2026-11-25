_: {
  flake.nixosModules.alco5hol-configuration =
    { inputs, ... }:
    {
      imports = [
        ./_hardware-configuration.nix
        inputs.nixos-hardware.nixosModules."lenovo-ideapad-slim-5"
      ];

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken.
      system.stateVersion = "26.05";

      networking.hostName = "alco5hol"; # Define your hostname.

      powerManagement = {
        enable = true;
        powertop.enable = true;
      };
      services.upower.enable = true;

      services.logind.settings.Login = {
        HandleLidSwitch = "ignore";
        KillUserProcesses = false;
      };

      # Enable TLP battery management
      # services.power-profiles-daemon.enable = false;
      # services.tlp.enable = true;
    };
}
