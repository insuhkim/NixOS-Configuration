{
  lib,
  config,
  userName,
  ...
}:
let
  cfg = config.base.system.user;
in
{
  options.base.system.user = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable default user account";
    };
  };

  config = lib.mkIf cfg.enable {
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${userName} = {
      isNormalUser = true;
      description = userName;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      packages = [ ];
    };
  };
}
