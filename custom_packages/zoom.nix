#{ fetchurl, stdenv, makeWrapper, pkgConfig }:
with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "zoom-2.0.52";
  
  src = fetchurl {
    url = https://zoom.us/client/latest/zoom_2.0.52458.0531_x86_64.tar.xz;
    sha256 = "ea3859760d4e014b4c22811b917dc020e479b718313102ad1bfb0899ec25a699";
  };

  phases = ["unpackPhase" "installPhase"];

  installPhase = ''
    mkdir -p $out
    cp -r * $out
    $out/zoom.sh
  '';

  meta = {
    description = "Video Chat and Conferencing Software";
    homepage = https://www.zoom.us;
  };
} 
