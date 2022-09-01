{ config, pkgs, ... }:

{
  imports = [ ];

  programs.git = {
    enable = true;
    userName = "Midka";
    userEmail = "me@midka.dev";
    extraConfig = {
      core = {
        editor = "nvim";
      };
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

  programs.bat = {
    enable = true;
    config = {
      theme = "GitHub";
    };
  };
}
