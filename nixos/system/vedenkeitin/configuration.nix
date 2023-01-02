{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/system/virtualisation
      ../../modules/system/base
      ../../modules/system/runtimes
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.efiSupport = true;

  fileSystems."/" =
    {
      device = "/dev/hmph/root"; # "/dev/disk/by-uuid/58ae5bf1-a533-42aa-8204-ea65101639c"
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/4054-C456";
      fsType = "vfat";
    };

  swapDevices =
    [{ device = "/dev/hmph/swap"; }];

  networking.hostName = "vedenkeitin";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Helsinki";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fi";
  };

  sys.virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.midka = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1h6h1R9O1sAk4mlJZYTEP27PuO9eEk6nZczOkQtgFwHpzhjMAnBpDD1WOJXVfX6XuWOoln9la5zAO5QCzUpqE9MdIMswlC/dMX4/J3PvwaHVNAzoq328q4d8TJGzS3INo//UE+hvaiS738hxs4hQ98F7IEQUdH0ZcBdZfpCnGQVxh3oXWcQlJMqikmAMw0iLauo1tAs3/aCjpQ2SHIsHkH4jjK107Y+gJU/ZMwvOgVTTIQDDeMw4sOs64cde0L+SvhhAKnHI4ZYG43c41gEfuTZyGUuFbtqGe+08kcLHI+W6u8z+2XlqV+L/9oCtDn5ZtEDJdf55zfQCo2J8L65XawycqXW5oZ6MQH+5xNm8AuX1J/dtyN0d8PII9QDC/k+1wZtamwngoobN+TzipY0NwxIsRUR73cOSix6/e04HP4YuZoGzGDLfGZqbDpUolb4ogACmqbfv1QxRtbwAeekYRut4GK7VG7Ssfx8QV9iCQlz1STZnhKej5G+ek1aeOTmX0Q9rm8CaQgajVStKhlQvLg8UjhA5+uPOljcZ3o7PGitIcyYjRXKQdC47VeqcI+RfLWuKmMsfpXm5i67awmKfMhl/1nX42a6BVZ3tY27lb3+iYjr7QbINBISvCRoj5Hyjo56NGktR0gu/nLGuLxV5Bj+uO2IvITgtchdHJ5cyexQ==" # probably termius
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCu54FYP9cmUeaerZwBz1m+2TUw1Lo+DiR4Y9xYRNcuNJPp7fsgEBiahnAUjHApJ1LKoOtL/dHPPBfvVGUo90ViXoykLq20YgMkNSxlWxK1YeM1WCpH2/bNvl3f3RA/8yDsaQcftNozazBVHXLE9NT+yBEcOUIURnDI9yoBKQOn8LjkAkzuxqkn1oZ2+ghLP52gcUQDfdtvYcvIse42R259LEqeHZbOrStGMsB6tQSNcoNrUyzkmXLVwa56y6+pKSzFFcfeflEzPpA7SQLS/texOvmaBAeYhKKRQ+s/eHfwJg7KLY0c+Qes1UZevSXtB89WvVex86RepKu5kggQ/hrceRI5q3D9U7xeSQiW6hBUkk99kfuy3pFi1A+bdSacjZssosSAnP3gsHCb0Ec0/72ov+jfyLGoj4tROlhvNWhweIjFgzF2Sd5zlX1byv4GOBnqH2piTZStfo4idUVzD50yOeMIaC8ThT3i2k4TX8s1+jvj/pU4Ct6/kYYtuUjTOk0=" # probably cooler?
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8qVs9WO2mqxaaD7RDgaA8bxXVbQTsuz4k2TOaj2WLcMg+XNfuLqqJ/BkCivqmm7t2qTEx/WEmtAd8x3mAAgBdi/SkBhK6Y7IRQq2+ZSI3HTsB5ec1FmUof+Z3JXPdKCZSIrDxmSS2MXU6STGOH23AW7dnzjIsUC/bovaS8Xekh81gaGShRF9LCWdI/f2bQ8R+53+J4RO3o8I1J5Lal+ZV/RBcO1CNj67PR1e+IS5a+l2ZDjORjOjezGtuKjbfHUEsRZCIm0CWIL574yHAVkgp+jcBWCDurzetQUNs88Jr8mzT2eqzYzw+ueIddFtfzFtpQCqTQ34Y1rxX++fQ6LtU/IN2iuE/5g8oqzt82tM/o54tZRfIRrXKrdSsOhbZ6f9mW9Q3fohZrHtW/e9gEVutYTC993Dn5VvUCmUuTx9btQU7quxr6HeENKuD5+QwpR8yAc9aMZhWQLdUoXpRQ7+ZG41v5zR/Yc1377BFJhMjtphy+qTSBK+ZP3JteEteGMc=" # school laptop
    ];
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  # Manage the user accounts using home manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.midka = import ./users/midka/home.nix;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    sudo
    direnv
    home-manager
  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = false;
    listenAddresses = [{ addr = "0.0.0.0"; port = 69; }];
  };
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    69
    25565
  ];
  # always allow traffic from your Tailscale network
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
  networking.firewall.checkReversePath = "loose";
  # allow the Tailscale UDP port through the firewall
  networking.firewall.allowedUDPPorts = [ config.services.tailscale.port ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # java
  # Programs and configurating them
  programs.java = {
    enable = true;
    additionalRuntimes = { inherit (pkgs) jdk8 jdk17; };
    package = pkgs.jdk8;
  };

  # tailscale
  services.tailscale.enable = true;

  # BACKUPS
  services.restic = {
    backups.system = {
      initialize = true;
      user = "root";
      passwordFile = "/root/.backups_secret";
      paths = [
        "/etc"
        "/home"
        "/root"
        "/var"
        "/usr/local/bin"
        "/usr/local/sbin"
        "/srv"
        "/otp"
      ];
      repository = "sftp:backups:./vedenkeitin";
      timerConfig = {
        OnUnitActiveSec = "12h";
      };
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 5"
        "--keep-yearly 10"
      ];
    };
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

