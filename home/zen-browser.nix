{
  lib,
  config,
  inputs,
  ...
}:
let
  cfg = config.myHome.programs.zenBrowser;
in
{
  imports = [ inputs.zen-browser.homeModules.beta ];

  options.myHome.programs.zenBrowser = {
    enable = lib.mkEnableOption "Enable zen-browser";
  };

  config = lib.mkIf cfg.enable {
    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = true;
    };
  };
}
