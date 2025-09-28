{ inputs, pkgs, settings, ... }: let
    # Bring in the unstable channel
    unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; };
in{
  home-manager.users.${settings.account.name}.home.packages = with pkgs; [
    # Terminal(s)
    foot

    # Development
    vscodium-fhs

    # Internet tools
    firefox google-chrome
  ];
}
