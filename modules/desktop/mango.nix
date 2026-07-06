{ pkgs, inputs, ... }:
{
  imports = [ inputs.mangowm.nixosModules.mango ];

  programs.mango.enable = true;

  environment.systemPackages = with pkgs; [ capitaine-cursors ];
}
