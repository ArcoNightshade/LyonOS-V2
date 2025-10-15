{ inputs, pkgs, settings, ... }: let
    # Bring in the unstable channel
    unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; };
in{
  # This line says what packages your user should have
  # installed, they aren't shared with root or other users
  home-manager.users.${settings.account.name}.home.packages = with pkgs; [

    # Dev tools
    git lazygit neovim gcc gh gh-contribs texlab

    # Creative/Music
    cmus

    # Utils
    fastfetch hyfetch brightnessctl flatpak zip unzip btop senpai ranger gnumake

    # Niri (And related)
    mako swww oreo-cursors-plus
  ];
  # Please see https://search.nixos.org/packages to see which packages are available
}
