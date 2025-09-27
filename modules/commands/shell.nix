{ ... }: {
  programs.bash.shellAliases = {
    nixrebuild = "sudo nixos-rebuild switch --flake /home/$USER/.lyonos#workstation";
  };
}
