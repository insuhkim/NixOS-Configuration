_: {
  flake.nixosModules.wine = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      wineWow64Packages.stable
      winetricks
    ];
    hardware.graphics.enable32Bit = true;
  };
}
