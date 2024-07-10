{
  inputs = { utils.url = "github:numtide/flake-utils"; };
  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            cmake
            openocd
            gcc-arm-embedded
            ninja
          ];
          shellHook = ''
            export OPENOCD_PATH="${pkgs.openocd}"
          '';
        };
      });
}
