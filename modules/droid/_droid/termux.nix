{
  config,
  pkgs,
  ...
}:

{
  terminal.font =
    let
      jetbrainsMonoNerd = pkgs.nerd-fonts.jetbrains-mono;
    in
    "${jetbrainsMonoNerd}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFontMono-Regular.ttf";

  android-integration = {
    am.enable = false;
    termux-open.enable = false;
    termux-open-url.enable = false;
    termux-reload-settings.enable = true;
    termux-setup-storage.enable = true;
    termux-wake-lock.enable = false;
    termux-wake-unlock.enable = false;
    unsupported.enable = false;
    xdg-open.enable = false;
  };

  build.activation.generateTermuxProperties = ''
    $DRY_RUN_CMD mkdir -p "$HOME/.termux"
    $DRY_RUN_CMD cp ${./termux.properties} "$HOME/.termux/termux.properties"
  '';
}
