{ inputs, userName, ... }:
{
  imports = [
    inputs.hjem.nixosModules.default
  ];

  hjem.users.${userName} = {
    user = userName;
    directory = "/home/${userName}";
    files = {
      ".config/blesh/init.sh".source = ./dotfiles/.blerc;
      ".config/starship.toml".source = ./dotfiles/starship.toml;
    };
  };
}
