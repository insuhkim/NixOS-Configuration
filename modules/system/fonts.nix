{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.base.system.fonts;
in
{
  options.base.system.fonts = {
    enable = lib.mkEnableOption "Enable extra fonts";
  };

  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts-cjk-sans
    ];
  };
}
