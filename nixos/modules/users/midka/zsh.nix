{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    initExtra = [ "export GPG_TTY=$(tty)" ];
  };
}
