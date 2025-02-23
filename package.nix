{
  lib,
  stdenv,
  fetchurl,
  pkgs,
}:

let
  rversion = "0.11.17-prerelease";
in
stdenv.mkDerivation rec {
  pname = "mantle";
  version = "v${rversion}";

  nativeBuildInputs = with pkgs; [
    unzip
  ];

  src = fetchurl {
    url = "https://github.com/blake-mealey/mantle/releases/download/${version}/mantle-linux.zip";
    sha256 = "sha256-9jwVAAU514JdcnE0RQDPMM44Hs5BlDxO4ttApenGXqA=";
  };

  unpackPhase = "unzip $src";

  installPhase = ''
    mkdir -p $out/bin
    cp mantle/target/release/mantle $out/bin
  '';
}
