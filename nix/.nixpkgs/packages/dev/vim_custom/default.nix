{ pkgs }:

let
 my_plugins = import ./plugins.nix { inherit (pkgs) vimUtils fetchFromGitHub pkgs; };

in with pkgs; vim_configurable.customize {
  name = "vim";
  vimrcConfig = {
    customRC = builtins.readFile ./vimrc;
    vam.knownPlugins = vimPlugins // my_plugins;
    vam.pluginDictionaries = [
      { names = [
        "sensible"
        "vim-bepo"
        "ale"
        "ctrlp"
        "vim-addon-nix"
        "youcompleteme"
        "molokai"
        "fugitive"
        "gitgutter"
        "vim-airline"
        "vim-airline-themes"
        "sleuth"
        "vim-go"
        "vimproc"
        "elm-vim"
        "nim-vim"
        "hexmode"
        "haskell-vim"
        "vim-async"
        "vim-lsp"
#        "Hoogle"
#        "ghc-mod-vim"
#        "stylish-haskell"
      ]; }
    ];
  };
}
