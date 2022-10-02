{ config, lib, pkgs, ... }:

{
  programs.zsh.initExtra = [
    "eval '$(direnv hook zsh)'"
  ];
}
