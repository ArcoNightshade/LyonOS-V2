{ ... }: {
  programs.bash.shellAliases = {
    trash = "gio trash"; # example: `trash not-needed/`
  };
}
