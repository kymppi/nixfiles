{ config, lib, pkgs, ... }:

{
  programs.zsh.enable = true;
  programs.zsh.initExtra = ''
    eval "$(direnv hook zsh)";
    eval "$(starship init zsh)";
    eval "$(export GPG_TTY=$(tty));"
  '';
}
