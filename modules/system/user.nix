{ ... }:
{
  flake.nixosModules.user =
    { ... }:
    let
      userName = "insuhkim";
    in
    {
      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.${userName} = {
        isNormalUser = true;
        description = userName;
        initialPassword = "password";
        extraGroups = [
          # "root"
          "networkmanager"
          "wheel"
        ];
        packages = [ ];
      };
    };
}
