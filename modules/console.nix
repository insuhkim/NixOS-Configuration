{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.base.system.console;
in
{
  options.base.system.console = {
    enable = lib.mkEnableOption "Enable customized console";
  };

  config = lib.mkIf cfg.enable {
    console = {
      earlySetup = true;
      font = "ter-v32n";
      packages = with pkgs; [ terminus_font ];
    };
  };
}
