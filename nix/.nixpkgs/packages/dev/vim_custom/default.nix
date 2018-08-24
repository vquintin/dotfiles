{ oldStable, stable, unstable }:

let
my_plugins = import ./plugins.nix { inherit stable; };

basePlugins = [
  "sensible"
  "vim-bepo"
  "Solarized"
  "vim-airline"
  "vim-airline-themes"
  "The_NERD_tree"
  "fzfWrapper"
  "fzf-vim"
];

hsvim = stable.neovim.override {
  configure = {
    customRC = 
    ''
      source ${./base.vim}
      source ${./haskell.vim}
    '';
    vam.knownPlugins = stable.vimPlugins // my_plugins;
    vam.pluginDictionaries = [
    {
      names = basePlugins ++ [
        "intero-neovim"
        "deoplete-nvim"
        "neco-ghc"
        "neomake"
        "haskell-vim"
      ];
    }
    ];
  };
};

scalavim = stable.vim_configurable.customize {
  name = "scalavim";
  vimrcConfig = {
    customRC =
    ''
      source ${./base.vim}
      source ${./scala.vim}
    '';
    vam.knownPlugins = stable.vimPlugins // my_plugins;
    vam.pluginDictionaries = [
    {
      names = basePlugins ++ [
        "vim-scala"
        "ensime-vim"
      ];
    }
    ];
  };
};

in with stable; {
  vim = vim_configurable.customize {
    name = "vim";
    vimrcConfig = {
      customRC = 
      ''
        source ${./base.vim}
        source ${./standard.vim}
      '';
      vam.knownPlugins = vimPlugins // my_plugins;
      vam.pluginDictionaries = [
        { 
          names = basePlugins ++ [
            "ale"
            "vim-addon-nix"
#            "youcompleteme"
            "molokai"
            "fugitive"
            "gitgutter"
            "sleuth"
            "vim-go"
            "vimproc"
            "elm-vim"
            "nim-vim"
            "hexmode"
            "vim-async"
#            "vim-lsp"
            "rainbow"
#          "Hoogle"
#          "ghc-mod-vim"
#          "stylish-haskell"
          ];
        }
      ];
    };
  };

  hsvim = stdenv.mkDerivation {
    name = "hsvim";
    buildInputs = [ makeWrapper ];
    buildCommand = ''
      makeWrapper ${hsvim}/bin/nvim $out/bin/hsvim
    '';
    meta = hsvim.meta;
  };

  inherit scalavim;
}
