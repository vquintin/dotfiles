{
  packageOverrides = pkgs_: with pkgs_; {
    my_vim = import ./vim-config { inherit pkgs ; };

    dev_env = with pkgs; buildEnv {
      name = "dev-env";
      paths = [
        my_vim
        git
      ];
    };

    mics_desktop = with pkgs; buildEnv {
      name = "mics-desktop";
      paths = [
        basic_gui_env
        dev_env
        jetbrains.idea-community
        jq
        sbt
        media_text
        openjdk
        ruby_2_4
        vagrant
      ];
    };

    basic_gui_env = with pkgs; buildEnv {
      name = "basic-gui-env";
      paths = [
        awesome
        cli_utils
        evince
        firefox
        gnome3.file-roller
        gui_utils
        pavucontrol
        termite
        xfce.thunar
        xscreensaver
      ];
    };

    basic_env = with pkgs; buildEnv {
      name = "basic-env";
      paths = [
	cli_utils
        zsh
      ];
    };

    cli_utils = with pkgs; buildEnv {
      name = "cli-utils";
      paths = [
        file
        htop
        lsof
        stow
        tree
      ];
    };

    gui_utils = with pkgs; buildEnv {
      name = "gui-utils";
      paths = [
        baobab
      ];
    };

    media_text = with pkgs; buildEnv {
      name = "media-text";
      paths = [
        calibre
      ];
    };
  };
}
