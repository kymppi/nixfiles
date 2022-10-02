{ config, pkgs, ... }:
{
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = true;
    format = "$username$hostname$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
    username = {
      style_root = "bright-red bold";
    };
    hostname = {
      ssh_only = true;
      ssh_symbol = "ssh";
      format = "[$ssh_symbol](bold blue) on [$hostname](bold red) ";
    };
    git_commit = {
      only_detached = true;
      format = "[ﰖ$hash]($style) ";
      style = "bright-yellow bold";
    };
    git_state = {
      style = "bright-purple bold";
    };
    git_status = {
      style = "bright-green bold";
    };
    directory = {
      read_only = " RO";
      truncation_length = 0;
    };
    cmd_duration = {
      format = "[$duration]($style) ";
    };
    jobs = {
      style = "bright-green bold";
    };
    character = {
      success_symbol = "[➜](bright-green bold) ";
      error_symbol = "[✗](bright-red bold) ";
    };
  };
}
