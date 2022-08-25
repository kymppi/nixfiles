{
  description = "Midka's Dev Server Dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager.url = "github:nix-community/home-manager";
  };
	
  outputs = { self, nixpkgs, home-manager, nixos-hardware }: 
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
     nixosConfigurations = {
	nixos-midka-vm = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            home-manager.nixosModules.home-manager
            ./system/nixos-midka-vm/configuration.nix
          ];
        };
     };
  };
}
