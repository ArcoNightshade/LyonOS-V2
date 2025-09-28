{
  description = "LyonOS Official Nix flake";
  inputs = {
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ ... }: let
    settings = {
      timeZone = "America/New_York";       # Set your timezone
      account.name = "lyon";               # Set your name
    };
    system = "x86_64-linux";               # System architecture
  in {
    nixosConfigurations.workstation = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system settings; };
      modules = [
        /* some stuff for chaotic nyx */
        inputs.chaotic.nixosModules.nyx-cache
        inputs.chaotic.nixosModules.nyx-overlay
        inputs.chaotic.nixosModules.nyx-registry
        inputs.home-manager.nixosModules.home-manager
        ./profile/workstation/hardware.nix
        ./profile/workstation/configuration.nix
        ./compose.nix
      ];
    };
    nixosConfigurations.iso = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system settings; };
      modules = [
        /* some stuff for chaotic nyx */
        inputs.chaotic.nixosModules.nyx-cache
        inputs.chaotic.nixosModules.nyx-overlay
        inputs.chaotic.nixosModules.nyx-registry
        inputs.home-manager.nixosModules.home-manager
        ./profile/iso/hardware.nix
        ./profile/iso/configuration.nix
        ./compose.nix
      ];
    };
    nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs system settings; };
      modules = [
        /* some stuff for chaotic nyx */
        inputs.chaotic.nixosModules.nyx-cache
        inputs.chaotic.nixosModules.nyx-overlay
        inputs.chaotic.nixosModules.nyx-registry
        inputs.home-manager.nixosModules.home-manager
        ./profile/desktop/hardware.nix
        ./profile/desktop/configuration.nix
        ./compose.nix
      ];
    };
  };
}
