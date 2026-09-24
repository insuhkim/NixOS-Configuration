{ pkgs, ... }:
{
  environment.packages = with pkgs; [
    ocaml
    dune_3
    ocamlPackages.ocaml-lsp
    ocamlPackages.ocamlformat
    binutils
    gcc
    # stdenv.cc
  ];
}
