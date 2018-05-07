{pkgs}:
let
  oldnixpkgs = builtins.fromJSON (builtins.readFile ./oldnixpkgs.json);
  src = pkgs.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    inherit (oldnixpkgs) rev sha256;
  };
  oldPkgs = import src { };
in
with pkgs; buildEnv {
  name = "jvm-stuff";
  paths = [
    ammonite
    oldPkgs.jetbrains.idea-community
    openjdk
    scala
    sbt
    visualvm
  ];
}

