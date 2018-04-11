{pkgs}:

let
  jvm_stuff = import ./jvm_stuff { inherit pkgs; };
  haskell = import ./haskell { inherit pkgs; };
  vim_custom = import ./vim_custom { inherit pkgs; };
in with pkgs; buildEnv {
  name = "dev-all";
  paths = [
    jvm_stuff
    haskell
    vim_custom
  ];
}

