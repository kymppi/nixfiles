{ config, pkgs, lib, ... }:

{
  xdg.configFile.nvim = {
    source = ../../../../non-nix-dotfiles/.config/nvim;
    recursive = true;
  };
}
