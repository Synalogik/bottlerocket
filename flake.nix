{
  description = "Cross compiling a rust program using rust-overlay";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/23.11";
    clang_pkgs.url =
      "github:NixOS/nixpkgs?rev=9957cd48326fe8dbd52fdc50dd2502307f188b0d";
    attic.url = "github:zhaofengli/attic";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs
    , flake-utils
    , ...
    }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (pkgs) lib;

      buildEnvPackages = with pkgs;
        [ pkg-config openssl openssl.dev rustup ]
        ++ lib.optionals pkgs.stdenv.isDarwin [
          pkgs.darwin.apple_sdk.frameworks.Foundation
          pkgs.libiconv
          pkgs.pkg-config
        ];
    in
    {
      devShells.default = pkgs.mkShell {
        packages = buildEnvPackages;
      };
    });

}

