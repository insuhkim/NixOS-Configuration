_: {
  flake.nixosModules.spotify =
    { inputs, pkgs, ... }:
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      imports = [
        inputs.spicetify-nix.nixosModules.default
      ];
      programs.spicetify = {
        enable = true;
        theme = spicePkgs.themes.comfy;
        # colorScheme = "mocha";
        enabledExtensions = with spicePkgs.extensions; [
          adblockify
          hidePodcasts
          shuffle
          keyboardShortcut
          fullAppDisplay
          loopyLoop
          popupLyrics
        ];
      };
      #       environment.systemPackages = with pkgs; [
      #         spotifast
      #       ];
      #
      #       programs.nix-ld.enable = true;
      #       programs.nix-ld.libraries = with pkgs; [
      #         stdenv.cc.cc.lib
      #         libpulseaudio
      #         alsa-lib
      #         openssl
      #         zlib
      #       ];
      #
      #       networking.firewall = {
      #         allowedUDPPorts = [ 5353 ];
      #         allowedTCPPorts = [ 57621 ];
      #       };
      #     };
    };
}
