{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./starship.nix
    ./git.nix
    ./nvim.nix
  ];

  programs.bat = {
    enable = true;
  };

  programs.go.enable = true;
}
