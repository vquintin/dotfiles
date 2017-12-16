{ pkgs }:

let
my_plugins = import ./plugins.nix { inherit (pkgs) vimUtils fetchFromGitHub; };

in with pkgs; vim_configurable.customize {
  name = "vim";
  vimrcConfig = {
    customRC = builtins.readFile ./vimrc;
    vam.knownPlugins = vimPlugins // my_plugins;
    vam.pluginDictionaries = [
      { names = [
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
        "vim-bepo"
        "vim-go"
        "vimproc"
        "elm-vim"
        "nim-vim"
        "hexmode"
        "haskell-vim"
        "Hoogle"
        "ghc-mod-vim"
        "stylish-haskell"
        "vim-scala"
        "vimpager"
      ]; }
    ];
  };
}
