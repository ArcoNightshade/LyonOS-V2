environment.systemPackages = with pkgs; [
  (st.overrideAttrs (oldAttrs: rec {
    patches = [
      # Fetch them directly from `st.suckless.org`
      (fetchpatch {
        url = "https://st.suckless.org/patches/rightclickpaste/st-rightclickpaste-0.8.2.diff";
        sha256 = "1y4fkwn911avwk3nq2cqmgb2rynbqibgcpx7yriir0lf2x2ww1b6";
      })
    ];
  }))
];
