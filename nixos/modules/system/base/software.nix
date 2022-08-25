{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    wget
    curl
    git
    htop
    killall
    tmux
    file
    gzip
    unzip
    zip
    exa
    bat
  ];

  environment.shells = [ pkgs.zsh pkgs.bash ];
}