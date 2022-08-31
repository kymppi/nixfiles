{ config, pkgs, ... }:

{
  imports = [];

  home.username = "midka";
  home.homeDirectory = "/home/midka";

  home.packages = with pkgs; [
    starship
  ];

  programs.git = {
    userName = "Midka";
    userEmail = "me@midka.dev";
  };

  # vscode-server

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
