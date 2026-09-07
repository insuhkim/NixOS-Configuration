{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.base.desktop.mango;
in
{
  options.base.desktop.mango = {
    enable = lib.mkEnableOption "Enable Mango Window Manager";
  };

  imports = [ inputs.mangowm.nixosModules.mango ];

  config = lib.mkIf cfg.enable {

    programs.mango.enable = true;
    programs.noctalia.enable = true;
    programs.noctalia.recommendedServices.enable = true;

    environment.systemPackages = with pkgs; [ capitaine-cursors ];

    services.displayManager.noctalia-greeter = {
      enable = true;
      settings = {
        cursor.size = 36;
        keyboard.layout = "us";
      };
      cursorTheme = {
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";
      };
    };
  };
}
