# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/system/virtualisation
      ../../modules/system/base
    ];
	
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "vedenkeitin";
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Helsinki";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fi";
  #   useXkbConfig = true; # use xkbOptions in tty.
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  sys.virtualisation.docker.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.midka = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1h6h1R9O1sAk4mlJZYTEP27PuO9eEk6nZczOkQtgFwHpzhjMAnBpDD1WOJXVfX6XuWOoln9la5zAO5QCzUpqE9MdIMswlC/dMX4/J3PvwaHVNAzoq328q4d8TJGzS3INo//UE+hvaiS738hxs4hQ98F7IEQUdH0ZcBdZfpCnGQVxh3oXWcQlJMqikmAMw0iLauo1tAs3/aCjpQ2SHIsHkH4jjK107Y+gJU/ZMwvOgVTTIQDDeMw4sOs64cde0L+SvhhAKnHI4ZYG43c41gEfuTZyGUuFbtqGe+08kcLHI+W6u8z+2XlqV+L/9oCtDn5ZtEDJdf55zfQCo2J8L65XawycqXW5oZ6MQH+5xNm8AuX1J/dtyN0d8PII9QDC/k+1wZtamwngoobN+TzipY0NwxIsRUR73cOSix6/e04HP4YuZoGzGDLfGZqbDpUolb4ogACmqbfv1QxRtbwAeekYRut4GK7VG7Ssfx8QV9iCQlz1STZnhKej5G+ek1aeOTmX0Q9rm8CaQgajVStKhlQvLg8UjhA5+uPOljcZ3o7PGitIcyYjRXKQdC47VeqcI+RfLWuKmMsfpXm5i67awmKfMhl/1nX42a6BVZ3tY27lb3+iYjr7QbINBISvCRoj5Hyjo56NGktR0gu/nLGuLxV5Bj+uO2IvITgtchdHJ5cyexQ==
"
"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCu54FYP9cmUeaerZwBz1m+2TUw1Lo+DiR4Y9xYRNcuNJPp7fsgEBiahnAUjHApJ1LKoOtL/dHPPBfvVGUo90ViXoykLq20YgMkNSxlWxK1YeM1WCpH2/bNvl3f3RA/8yDsaQcftNozazBVHXLE9NT+yBEcOUIURnDI9yoBKQOn8LjkAkzuxqkn1oZ2+ghLP52gcUQDfdtvYcvIse42R259LEqeHZbOrStGMsB6tQSNcoNrUyzkmXLVwa56y6+pKSzFFcfeflEzPpA7SQLS/texOvmaBAeYhKKRQ+s/eHfwJg7KLY0c+Qes1UZevSXtB89WvVex86RepKu5kggQ/hrceRI5q3D9U7xeSQiW6hBUkk99kfuy3pFi1A+bdSacjZssosSAnP3gsHCb0Ec0/72ov+jfyLGoj4tROlhvNWhweIjFgzF2Sd5zlX1byv4GOBnqH2piTZStfo4idUVzD50yOeMIaC8ThT3i2k4TX8s1+jvj/pU4Ct6/kYYtuUjTOk0="
    ];
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [];
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
    home-manager
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
	enable = true;
	permitRootLogin = "no";
	passwordAuthentication = false;
	listenAddresses = [{addr = "0.0.0.0"; port = 69;}];
  };
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 
    69
  ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

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

