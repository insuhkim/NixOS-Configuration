{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./termux.nix
    ./ocaml.nix
  ];

  environment.motd = "Hello, world!";

  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    neovim
    helix
    git
    gh
    jujutsu
    zellij
    man
    blesh
    nix-output-monitor
    gawk
    eza
    bat
    yazi
    delta
    zoxide
    devenv
    tldr
    which
    fastfetch
    nixfmt

    openssh

    # Some common stuff that people expect to have
    procps
    killall
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip

    patch
  ];

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  time.timeZone = "Asia/Seoul";

  home-manager = {
    config = ./home;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };

  nix.package = pkgs.lixPackageSets.stable.lix;
}
