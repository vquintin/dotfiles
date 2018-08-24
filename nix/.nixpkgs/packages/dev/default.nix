{ oldStable, stable, unstable }:
let
  jvm_stuff = import ./jvm_stuff { inherit oldStable stable unstable; };
  haskell = import ./haskell { inherit oldStable stable unstable; };
  vim_custom = import ./vim_custom { inherit oldStable stable unstable; };
in with stable; buildEnv {
  name = "dev-all";
  paths = [
    jvm_stuff
    haskell
    vim_custom.vim
    vim_custom.hsvim
    vim_custom.scalavim
    python27Packages.sexpdata
    python27Packages.websocket_client
  ];
}

