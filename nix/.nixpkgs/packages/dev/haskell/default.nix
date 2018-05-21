{ oldStable, stable, unstable }:

with stable; buildEnv {
  name = "haskell-stuff";
  paths = [
    cabal2nix
  ];
}

