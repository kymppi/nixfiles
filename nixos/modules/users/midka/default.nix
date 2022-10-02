{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./starship.nix
    ./git.nix
  ];

  programs.bat = {
    enable = true;
  };
}
