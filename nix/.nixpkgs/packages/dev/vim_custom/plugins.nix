{ vimUtils, fetchFromGitHub, pkgs }:
{
  ale = vimUtils.buildVimPluginFrom2Nix {
    name = "ale-2017-07-10";
    src = fetchFromGitHub {
      owner = "w0rp";
      repo = "ale";
      rev = "b44f6053d1faffa47191009f84dc36d14ebc3992";
      sha256 = "1vdk8s5inry8xkwa10cyjfdjqyxby76n2sm7gkz0rfqagh9v10g8";
    };
    dependencies = [];
  };

  elm-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "elm.vim-2017-01-13";
    src = fetchFromGitHub {
      owner = "ElmCast";
      repo = "elm-vim";
      rev = "0c1fbfdf12f165681b8134ed2cae2c148105ac40";
      sha256 = "0l871hzg55ysns5h6v7xq63lwf4135m3xggm2s4q2pmzizivk0x2";
    };
    dependencies = [];
  };

  vim-pony = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-pony-2016-11-14";
    src = fetchFromGitHub {
      owner = "jakwings";
      repo = "vim-pony";
      rev = "26ad120229dbb4470cd9de2b6f6a57a0fa1ac6c6";
      sha256 = "1s19dpj7kglc05bb5yyq1w9aa2sg76h56cldjcvdckj5x3r7j5ni";
    };
    dependencies = [];
  };

  vim-javascript = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-javascript-2016-11-10";
    src = fetchFromGitHub {
      owner = "pangloss";
      repo = "vim-javascript";
      rev = "d736e95330e8aa343613ad8cddf1e7cc82de7ade";
      sha256 = "136q0ask4dp99dp7fbyi1v2qrdfy6mnrh0a3hzsy9aw5g2f2rvbj";
    };
    dependencies = [];
  };

  vim-vue = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-vue-2016-10-22";
    src = fetchFromGitHub {
      owner = "posva";
      repo = "vim-vue";
      rev = "e13f9abf5ff71954226f71f60175f78efd7bfadd";
      sha256 = "07zwhzna5g22scjy2mq4clsgpkfavpgxiqvnfbfydgc52h73l27r";
    };
    dependencies = [];
  };

  nim-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "nim.vim-2016-05-19";
    src = fetchFromGitHub {
      owner = "zah";
      repo = "nim.vim";
      rev = "dcf25798f4a3f75e9538f9915959061edbff97cf";
      sha256 = "1jaiqkspfz2a4ny130dl0h6x9752flpcwwy0kscrqmlqf5fqiyvm";
    };
    dependencies = [];
  };

  alchemist-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "alchemist-vim-2016-11-07";
    src = fetchFromGitHub {
      owner = "slashmili";
      repo = "alchemist.vim";
      rev = "718d16c38f473254589f4e71b6b0680b55d88fcf";
      sha256 = "0v2gb234rbzz31x1xgaq2x03hzzsijiaq3c96z3yhl82pvrfsfzy";
    };
    dependencies = [];
  };

  hexmode = vimUtils.buildVimPluginFrom2Nix {
    name = "hexmode-2016-11-04";
    src = fetchFromGitHub {
      owner = "fidian";
      repo = "hexmode";
      rev = "27932330b9a36c91a6039267bc32a18060e82d57";
      sha256 = "00xdv6d3rmalv342ajqd7cgbci97frd7pmsrgfnaqcfimycka3la";
    };
    dependencies = [];
  };

  vim-bepo = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-bepo-2017-10-25";
    src = fetchFromGitHub {
      owner = "michamos";
      repo = "vim-bepo";
      rev = "f861bfe0bb59303436284368f6ab83ffce5121b8";
      sha256 = "1b3jhapb862kmwp8arjnq470r47qmc2dqa5x1qk7gbl82i8m3n3d";
    };
    dependencies = [];
  };

  vimpager = vimUtils.buildVimPluginFrom2Nix {
    name = "vimpager-2017-11-25";
    src = fetchFromGitHub {
      owner = "rkitover";
      repo = "vimpager";
      rev = "f03db2eb63993d85974913ff017d684069530e87";
      sha256 = "07asj1ggdxk1bx3p0raczwj830kd3hbnra1plm5gmq0lcymnpgfw";
    };
    dependencies = [];
  };

  vim-async = vimUtils.buildVimPluginFrom2Nix {
    name = "async.vim-2018-1-28";
    src = fetchFromGitHub {
      owner = "prabirshrestha";
      repo = "async.vim";
      rev = "f29f6167a1ef431b8c34587a80ed44e8fdc669d4";
      sha256 = "0s6ycxn212yrf9x79yx5cn5vga6y331grck4zfq43h2z0n7h998k";
    };
    dependencies = [];
  };

  vim-lsp = vimUtils.buildVimPluginFrom2Nix {
    name = "lsp-vim-2018-1-20";
    src = fetchFromGitHub {
      owner = "prabirshrestha";
      repo = "vim-lsp";
      rev = "2e4954cc9e22dec52f025f581ff292c53bb4ae52";
      sha256 = "15d4l92g5r0qbmp2qqhsdbvf6zgz4scjsl85za5jk3q11d42j86f";
    };
    dependencies = [];
  };

  languageclient = vimUtils.buildVimPluginFrom2Nix {
    name = "LanguageClient-neovim-2017-11-25";
    src = fetchFromGitHub {
      owner = "autozimu";
      repo = "LanguageClient-neovim";
      rev = "55bbfacdff17689a52709261d40a16c90274195c";
      sha256 = "1rz5b5hicbrd5f6dns1x68vzyizfmpvkfqr8331a0arxbfsm80zs";
    };
    dependencies = [];
    buildInputs = [ pkgs.rustChannels.stable.rust ];
    buildPhase = ''
      export SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
      export HOME=$TMP
      ulimit -S -a
      patchShebangs .
      ./install.sh || ./install.sh
    '';
  };

  intero-neovim = vimUtils.buildVimPluginFrom2Nix {
    name = "intero-neovim";
    src = fetchFromGitHub {
      owner = "parsonsmatt";
      repo = "intero-neovim";
      rev = "26d340ab0d6e8d40cbafaf72dac0588ae901c117";
      sha256 = "0y4bbbj6v9jq825ffpdx03hi6ldszqh2zxasc6h1b0vkpjmdc8y3";
    };
    dependencies = [];
  };


  ensime-vim = vimUtils.buildVimPluginFrom2Nix { # created by nix#NixDerivation
    name = "ensime-vim-2017-08-27";
    src = fetchFromGitHub {
      owner = "ensime";
      repo = "ensime-vim";
      rev = "d992b971a84afdfb2d99896d8aed537030e09a80";
      sha256 = "1rhrq3zplvpyli1ymqjmhq91p61ixpjz1v5xf68nvq4ax50nl45z";
    };
    patches = [ 
      ./ensime-vim/0001-Add-dependencies-to-python-path.patch 
      ./ensime-vim/0002-Refactor.patch
    ];
    dependencies = ["vimproc" "vimshell" "self" "forms"];
    pythonDependencies = with pkgs.pythonPackages; [ sexpdata websocket_client ];
    buildInputs = with pkgs.pythonPackages; [ sexpdata websocket_client ];
    buildPhase = ''
      substituteInPlace plugin/ensime.vim \
        --replace "__SIX_PATH__" \
        "${pkgs.python27Packages.six}/lib/python2.7/site-packages"

      substituteInPlace plugin/ensime.vim \
        --replace "__SEXPDATA_PATH__" \
        "${pkgs.python27Packages.sexpdata}/lib/python2.7/site-packages"

      substituteInPlace plugin/ensime.vim \
        --replace "__WEBSOCKET_CLIENT_PATH__" \
        "${pkgs.python27Packages.websocket_client}/lib/python2.7/site-packages"
    '';
  };
}
