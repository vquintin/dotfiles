{ oldStable, stable, unstable }:
let
  sbtixSrc = stable.fetchFromGitHub {
    owner = "teozkr";
    repo = "Sbtix";
    inherit (builtins.fromJSON (builtins.readFile ./sbtix.json)) rev sha256;
  };
  sbtix = import sbtixSrc { };
  stablePkgs = builtins.fromJSON (builtins.readFile ./../../../stable.json);
  stableSrc = stable.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    inherit (stablePkgs) rev sha256;
  };
  oldStablePkgs = builtins.fromJSON (builtins.readFile ./../../../oldstable.json);
  oldStableSrc = oldStable.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    inherit (oldStablePkgs) rev sha256;
  };
  graal_ee = stable.callPackage (
      import (stableSrc + "/pkgs/development/compilers/oraclejdk/jdk-linux-base.nix") {
      productVersion = "1.0.0";
      patchVersion = "rc1";
      downloadUrl = "http://www.oracle.com/technetwork/oracle-labs/program-languages/downloads/index.html";
      sha256.x86_64-linux = "6e3f10e88a1e91ff254ff27a2f013daf50a7384cd8144c55b08b9e0ca2e4a9aa";
      sha256.i686-linux = "0dh5r02v40pinway952fflw2r0i1xi67hmyb87c278qfp4jn929p";
      sha256.armv7l-linux = "1bqivmp1wfnypgg5bsfzi25yzl7vd2xncfap9mi8jn63aj633dw0";
      sha256.aarch64-linux = "1016lf3g1syjsl29m58s2s2w9nkj4jkvxhqg4s35vy41cs2v77j7";
      jceName = "jce_policy-8.zip";
      jceDownloadUrl = http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html;
      sha256JCE = "0n8b6b8qmwb14lllk2lk1q1ahd3za9fnjigz5xn65mpg48whl0pk";
    }
  ) {installjdk = true; pluginSupport = false;};
  graal_sbt = stable.callPackage (stableSrc + "/pkgs/development/tools/build-managers/sbt") {jre = {home = graal_ee;}; };
  recurseIntoAttrs = attrs: attrs // { recurseForDerivations = true; };
  graal_jetbrains = (recurseIntoAttrs (oldStable.callPackages (oldStableSrc + "/pkgs/applications/editors/jetbrains") {
    jdk = graal_ee;
    androidsdk = oldStable.androidsdk_extras;
  }) // {
    jdk = graal_ee;
  });
in
with stable; buildEnv {
  name = "jvm-stuff";
  paths = [
    oldStable.jetbrains.idea-community
    sbt
    visualvm
    openjdk
  ];
}

