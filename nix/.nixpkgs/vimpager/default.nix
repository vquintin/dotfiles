{ pkgs }:
with pkgs; stdenv.mkDerivation {
  name="vimpager-2.06";
  builder=./builder.sh;
  src = fetchFromGitHub {
    owner = "rkitover";
    repo = "vimpager";
    rev = "9a4c7ed8a019deb5c23a1bb360d33a14f8c2223c";
    sha256 = "05yr7j72bw64nx7a0y6w9fjmz54zd4g46fn1qjfbbqvbc19fjpl8";
  };

}
