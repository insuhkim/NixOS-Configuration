{ ... }: {
  flake.nixosModules.kmscon =
    { pkgs, ... }:
    {
      # Nerd Font
      fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
        noto-fonts-cjk-sans
      ];

      fonts.fontconfig.enable = true;

      # Replace Linux virtual terminals with kmscon
      services.kmscon = {
        enable = true;
        useXkbConfig = true;

        config = {
          font-engine = "freetype";
          font-name = "JetBrainsMono Nerd Font";
          font-size = 18;
        };
      };
    };
}
