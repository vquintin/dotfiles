{ pkgs }:

let
my_plugins = import ./plugins.nix { inherit (pkgs) vimUtils fetchFromGitHub pkgs; };
basePlugins = [
  "vim-bepo"
  "Solarized"
  "vim-airline"
  "vim-airline-themes"
  "The_NERD_tree"
];
in with pkgs; {
  vim = vim_configurable.customize {
    name = "vim";
    vimrcConfig = {
      customRC = builtins.readFile ./vimrc;
      vam.knownPlugins = vimPlugins // my_plugins;
      vam.pluginDictionaries = [
        { 
          names = basePlugins ++ [
            "sensible"
            "ale"
            "ctrlp"
            "vim-addon-nix"
            "youcompleteme"
            "molokai"
            "fugitive"
            "gitgutter"
            "sleuth"
            "vim-go"
            "vimproc"
            "elm-vim"
            "nim-vim"
            "hexmode"
            "haskell-vim"
            "vim-async"
            "vim-lsp"
            "vim-scala"
            "ensime-vim"
            "rainbow"
#          "Hoogle"
#          "ghc-mod-vim"
#          "stylish-haskell"
          ];
        }
      ];
    };
  };

  hsvim = pkgs.neovim.override {
    configure = {
      customRC = 
      ''
        source ${./base.vim}
        source ${./haskell.vim}
      '';
      vam.knownPlugins = vimPlugins // my_plugins;
      vam.pluginDictionaries = [
        {
          names = basePlugins ++ [
            "intero-neovim"
            "deoplete-nvim"
            "neco-ghc"
            "neomake"
          ];
        }
      ];
    };
  };
}
