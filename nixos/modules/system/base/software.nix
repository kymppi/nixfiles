{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    neofetch
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
    nodejs
    yarn
  ];

  # Pinentry
  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;
  programs.zsh.interactiveShellInit = ''
    export GPG_TTY=$(tty)
  '';
  # environment.interactiveShellInit = ''
  #   export GPG_TTY=$(tty)

  #   ${pkgs.gnupg}/bin/gpg-connect-agent --quiet updatestartuptty /bye > /dev/null

  #   if [ -z "$SSH_AUTH_SOCK" ]; then
  #     export SSH_AUTH_SOCK=$(${pkgs.gnupg}/bin/gpgconf --list-dirs agent-ssh-socket)
  #   fi
  # '';

  environment.shells = [ pkgs.zsh pkgs.bash ];
}
