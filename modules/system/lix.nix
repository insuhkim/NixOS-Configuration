{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.base.system.lix;
in
{
  options.base.system.lix = {
    enable = lib.mkEnableOption "Enable lix";
  };

  config = lib.mkIf cfg.enable {
    nix.package = pkgs.lixPackageSets.stable.lix;
  };
}
