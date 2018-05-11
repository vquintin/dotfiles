{ pkgs }:

let
my_plugins = import ./plugins.nix { inherit (pkgs) vimUtils fetchFromGitHub pkgs; };

basePlugins = [
  "vim-bepo"
  "Solarized"
  "vim-airline"
  "vim-airline-themes"
  "The_NERD_tree"
  "fzfWrapper"
  "fzf-vim"
];

hsvim = pkgs.neovim.override {
  configure = {
    customRC = 
    ''
      source ${./base.vim}
      source ${./haskell.vim}
    '';
    vam.knownPlugins = pkgs.vimPlugins // my_plugins;
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

in with pkgs; {
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
            "sensible"
            "ale"
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

  hsvim = stdenv.mkDerivation {
    name = "hsvim";
    buildInputs = [ makeWrapper ];
    buildCommand = ''
      makeWrapper ${hsvim}/bin/nvim $out/bin/hsvim
    '';
    meta = hsvim.meta;
  };
}
