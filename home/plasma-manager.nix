{
  programs.plasma = {
    enable = true;

    # overrideConfig = true;

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
}
