{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      username = "dennis";
      stateVersion = "24.05";
    in
    {
      formatter."x86_64-linux" = nixpkgs.legacyPackages."x86_64-linux".nixfmt-rfc-style;

      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit username stateVersion inputs;
        };
        modules = [
          ./config

          # change files if needed

          ./host/squid
          # if you have not yet built cosmic, run nixos-rebuild test with only
          # the cache added
          # https://github.com/lilyinstarlight/nixos-cosmic
          ./desktop-environment/cosmic

          # ./desktop-environment/gnome
        ];
      };

      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit username stateVersion;
        };
        modules = [
          nixvim.homeManagerModules.default

          ./home-manager
        ];
      };
    };
}
