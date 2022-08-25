{
  description = "Midka's Remote Development Server";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
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
