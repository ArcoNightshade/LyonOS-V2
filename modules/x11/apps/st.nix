{ inputs, pkgs, ... }: let
    # Bring in the unstable channel
    unstable = import inputs.nixpkgs-unstable { inherit (pkgs) system; };
in{
  environment.systemPackages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      patches = [
        # Fetch them directly from st.suckless.org
        (fetchpatch {
          url = "https://st.suckless.org/patches/rightclickpaste/st-rightclickpaste-0.8.2.diff";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.4.diff";
        })
      ];
    }))
  ];
}
