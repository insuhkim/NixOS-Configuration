{
  pkgs,
  lib,
  config,
  ...
}:
{
  # Core system settings that are always enabled when this module is imported
  config = {
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken.
    system.stateVersion = "26.05";

    # Enable flakes
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # List packages installed in system profile.
    environment.systemPackages = with pkgs; [
      git
      neovim
    ];

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Set default shell to ZSH
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.enable = true;
  };
}
