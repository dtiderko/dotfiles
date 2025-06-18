{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs =
    { nixpkgs
    , home-manager
    , nixvim
    , ...
    }@inputs:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      username = "dennis";
      stateVersion = "24.05";

      rebuild = pkgs.writeShellScriptBin "rebuild" ''
        case $1 in
          "system")
            echo "Root privilages will be required."
            sudo echo "Root privilages have been successfully acquired."
            echo

            echo "> Updating system"
            echo
            sudo nixos-rebuild switch --flake /home/${username}/dotfiles
          ;;
          "home")
            echo "> Updating home"
            echo
            home-manager switch --flake /home/${username}/dotfiles#default
          ;;
          *)
            echo "Invaild argument! Use one of the following:"
            echo "- `system`"
            echo "- `home`"
          ;;
        esac
      '';
      update = pkgs.writeShellScriptBin "update" ''
        echo "Root privilages will be required."
        sudo echo "Root privilages have been successfully acquired."
        echo

        echo "> Starting full update"
        echo "> Updating inputs..."
        echo
        nix flake update --flake /home/${username}/dotfiles/

        ${rebuild}/bin/rebuild system
        echo
        ${rebuild}/bin/rebuild home
      '';

      modules = [
        ./config
        ./desktop-environment

        (
          { pkgs, ... }:
          {
            environment.systemPackages = [
              pkgs.home-manager
              rebuild
              update
            ];
          }
        )

      ];
    in
    {
      formatter."x86_64-linux" = pkgs.nixpkgs-fmt;

      nixosConfigurations = {
        kraken = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit username stateVersion inputs;
          };
          modules = [
            ./host/kraken
          ] ++ modules;
        };

        squid = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit username stateVersion inputs;
          };
          modules = [
            ./host/squid
          ] ++ modules;
        };
      };

      homeConfigurations.default = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit username stateVersion inputs;
        };
        modules = [
          nixvim.homeManagerModules.default

          ./home-manager
          ./desktop-environment/home-manager
        ];
      };
    };
}
