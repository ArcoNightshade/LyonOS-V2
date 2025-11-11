{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    st
  ];
}
