{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.base.programs.webcord;
in
{
  options.base.programs.webcord = {
    enable = lib.mkEnableOption "Enable webcord";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ webcord ];
  };
}
