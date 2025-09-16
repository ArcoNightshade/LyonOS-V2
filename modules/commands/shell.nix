{ ... }: {
  programs.bash.shellAliases = {
    trash = "gio trash"; # example: `trash not-needed/`
    fastfetch = "fastfetch --logo nixos";
    nixrebuild = "sudo nixos-rebuild switch --flake /home/$USER/.lyonos#workstation";
  };
}
