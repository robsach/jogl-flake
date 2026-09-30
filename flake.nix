{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      jogamp-2-6-0-url = "https://jogamp.org/deployment/archive/rc/v2.6.0/fat/jogamp-fat.jar";
      hash = "sha256-Eu/A1bDKf4UKdDgrms3qQVjJnXACP7R0yM8pJ9RUqI4=";
      jogamp-file = pkgs.fetchurl {
        url = jogamp-2-6-0-url;
        sha256 = hash;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.libxxf86vm
        ];

        packages = [
          pkgs.jdk21
        ];

        shellHook = ''
          echo "[+] jdk21"


          # It is fetched (if not already present)
          echo "[+] fetched jogamp-fat.jar"

          # Used in aliases.sh
          export JOGAMPPATH=${jogamp-file}
          echo "[+] JOGAMPPATH set to $JOGAMPPATH"


          # Add libxxf86vm to dynamic linker path, else can't find it
          export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [ pkgs.libxxf86vm ]}:$LD_LIBRARY_PATH"
          echo "[+] LD_LIBRARY_PATH set to $LD_LIBRARY_PATH"
        '';
      };
    };
}
