{
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.myHome.desktop.plasma;
in
{
  imports = [ inputs.plasma-manager.homeModules.plasma-manager ];

  options.myHome.desktop.plasma = {
    enable = lib.mkEnableOption "Enable plasma-manager configuration";
  };

  config = lib.mkIf cfg.enable {
    programs.plasma = {
      enable = true;

      shortcuts = {
        kwin."Window Close" = "Meta+Q";

        kwin."Window Maximize" = "Meta+F";

        kwin."Switch Window Down" = "Meta+J";
        kwin."Switch Window Left" = "Meta+H";
        kwin."Switch Window Right" = "Meta+L";
        kwin."Switch Window Up" = "Meta+K";

        ksmserver."Log Out" = "Meta+X";
      };

      configFile = {
        kwinrc = {
          Effect-overview.BorderActivate = 9;
          Effect-translucency.Inactive = 90;
          Effect-translucency.MoveResize = 83;
          Plugins.blurEnabled = true;
          Plugins.slidebackEnabled = true;
          Plugins.translucencyEnabled = true;
          Plugins.wobblywindowsEnabled = true;
        };
      };
    };
  };
}
