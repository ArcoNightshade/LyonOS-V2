{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    uutils-coreutils-noprefix
    nushell
  ];

  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };
}
