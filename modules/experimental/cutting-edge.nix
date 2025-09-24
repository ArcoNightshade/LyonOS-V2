{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    uutils-coreutils-noprefix
    nushell
  ];

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
    options = [ "--cmd cd" ];
  };
}
