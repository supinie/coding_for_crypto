with import <nixpkgs> {};
mkShell {
    buildInputs = [ gcc python3 sage python312Packages.fpylll fplll gap ];
}
