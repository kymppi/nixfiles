{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Midka";
    userEmail = "me@midka.dev";
    signing = {
      signByDefault = true;
      key = "8C263C757330B5BA";
    };
    extraConfig = {
      core = {
        editor = "nvim";
      };
      url."ssh://git@".insteadOf = "git://";
      color = {
        ui = true;
      };
      push = {
        default = "simple";
      };
      pull = {
        ff = "only";
      };
      init = {
        defaultBranch = "main";
      };
    };
    ignores = [
      ".DS_Store"
      "*.pyc"
    ];
  };
}
