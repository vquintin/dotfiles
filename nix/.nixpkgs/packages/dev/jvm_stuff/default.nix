{ oldStable, stable, unstable }:
let
  sbtixSrc = stable.fetchFromGitHub {
    owner = "teozkr";
    repo = "Sbtix";
    inherit (builtins.fromJSON (builtins.readFile ./sbtix.json)) rev sha256;
  };
  sbtix = import sbtixSrc { };
in
with stable; buildEnv {
  name = "jvm-stuff";
  paths = [
    ammonite
    oldStable.jetbrains.idea-community
    scala
    sbt
    sbtix
    visualvm
    unstable.graalvm8
  ];
}

