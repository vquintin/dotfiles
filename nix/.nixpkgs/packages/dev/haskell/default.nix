{pkgs}:

with pkgs; buildEnv {
  name = "haskell-stuff";
  paths = [
    cabal2nix
  ];
}

