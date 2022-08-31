{
  description = "Midka's NixFiles for multiple environments (dev server)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    vscode-server.url = "github:msteen/nixos-vscode-server";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, vscode-server }:
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
        vedenkeitin = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            home-manager.nixosModules.home-manager
            vscode-server.nixosModule
            ({ config, pkgs, ... }: {
              services.vscode-server.enable = true;
            })
            ./system/vedenkeitin/configuration.nix
          ];
        };
      };
    };
}
