{ config, pkgs, lib, ... }:

{
  xdg.configFile.nvim = {
    source = ../../../nvim;
    recursive = true;
  };
}
