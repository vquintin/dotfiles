{pkgs}:

with pkgs; buildEnv {
  name = "haskell-stuff";
  paths = [
    stack
    stack2nix
  ];
}

