{ config, pkgs, lib, ... }:

with lib;
with pkgs;
let
  cfg = config.sys.virtualisation;
in
{
  options.sys.virtualisation.docker = {
    enable = mkEnableOption "Enable Docker containerization";
  };

  config = {
    virtualisation.docker.enable = cfg.docker.enable;
  };
}
