{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    initExtra = ''
      eval "$(direnv hook zsh)";
      eval "$(starship init zsh)";
      eval "$(export GPG_TTY=$(tty));"
    '';
    shellAliases = {
      run = "nix run";
      dev = "nix develop";
      gs = "git status";
      gc = "git commit";
    };
  };
}

