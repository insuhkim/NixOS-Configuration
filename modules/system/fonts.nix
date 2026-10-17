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
    fonts = {
      packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        atkinson-hyperlegible-next
        noto-fonts-cjk-sans
        nerd-fonts.d2coding
      ];
      fontconfig = {
        enable = true;
        defaultFonts = {
          sansSerif = [
            "Atkinson Hyperlegible Next"
            "Noto Sans CJK KR"
          ];

          serif = [
            "Atkinson Hyperlegible Next"
            "Noto Sans CJK KR"
          ];

          monospace = [
            "Atkinson Hyperlegible Mono"
            "D2Coding"
            "Noto Sans Mono CJK KR"
          ];
        };
      };
    };
  };
}
