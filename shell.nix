{ pkgs ? import <nixpkgs> {}
}:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    openscad
    openscad-lsp
    prusa-slicer
  ];

  shellHook = ''
    LOCALE_ARCHIVE="$(nix-build --no-out-link '<nixpkgs>' -A glibcLocales)/lib/locale/locale-archive"

    export LANG=en_GB.UTF-8
  '';
}
