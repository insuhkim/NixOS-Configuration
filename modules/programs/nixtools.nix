{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    nixd
    nixfmt-rfc-style
    nix-output-monitor
    # nh
  ];
}
