{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      patches = [
        # Fetch them directly from st.suckless.org
        (fetchpatch {
          url = "https://st.suckless.org/patches/background_image/st-background-image-0.8.4.diff";
          sha256 = "bdca2ab413b622c1e8708b44daa216acb37d72d252db7c1f9f26d922e1093a2e";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.4.diff";
          sha256 = "418e1c5df11105482f13a008218c89eadb974630c25b4a6ff3da763dc2560e44";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/ligatures/0.8.3/st-ligatures-20200430-0.8.3.diff";
          sha256 = "67b668c77677bfcaff42031e2656ce9cf173275e1dfd6f72587e8e8726298f09";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/gruvbox/st-gruvbox-dark-0.8.5.diff";
          sha256 = "5b5a8c18945c7ef98ba7d857cc84881a8e97024fd0f3ca1a628303ea4004764b";
        })
      ];
    }))
  ];
}
