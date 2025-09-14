{ inputs, pkgs, settings, ... }: let
    # Bring in the unstable channel
    unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; };
in{
  nixpkgs.config.packageOverrides = pkgs: {
    haskell-language-server = pkgs.haskell-language-server.override {
      supportedGhcVersions = [ "984" ];
    };
  };
  # This line says what packages your user should have
  # installed, they aren't shared with root or other users
  home-manager.users.${settings.account.name}.home.packages = with pkgs; [
    haskell.compiler.ghc984
    haskell-language-server
  ];
}
