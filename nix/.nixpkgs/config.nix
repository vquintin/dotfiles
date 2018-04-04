{
  allowUnfree = true;

  hardware.opengl.driSupport32Bit = true;
  permittedInsecurePackages = [
    "webkitgtk-2.4.11"
  ];

  packageOverrides = pkgs_: with pkgs_; {
    my_vim = import ./vim-config { inherit pkgs ; };
    vimpager = import ./vimpager { inherit pkgs ; };

    home_laptop = with pkgs; buildEnv {
      name = "home-laptop";
      paths = [
        blueman
        cbatticon
        home_gui
        networkmanagerapplet
        powertop
        rfkill
        wirelesstools
        xorg.xbacklight
      ];
    };

    home_server = with pkgs; buildEnv {
      name = "home-server";
      paths = [
        accounting
        basic_gui_env
        dev_gui_env
        cli_utils
        dev_cli_env
        media_picture
        media_sound
        media_video
        media_text
      ];
    };

    jvm_stuff = import ./dev/jvm-stuff {inherit pkgs;};

    home_gui = with pkgs; buildEnv {
      name = "home-gui";
      paths = [
        accounting
        basic_gui_env
        dev_gui_env
        games
        internet_prgms
        media_picture
        media_sound
        media_video
        media_text
      ];
    };

    mics_desktop = with pkgs; buildEnv {
      name = "mics-desktop";
      paths = [
        basic_gui_env
        dev_gui_env
        google-drive-ocamlfuse
        jq
        media_picture
        media_text
        nodePackages.grunt-cli
        nodePackages.npm
        nodejs
        openjdk
        phantomjs2
        ruby_2_4
        vagrant
        visualvm
      ];
    };

    my_fonts = import ./my_fonts.nix { inherit pkgs;};

    dev_gui_env = with pkgs; buildEnv {
      name = "dev-gui-env";
      paths = [
        atom
        dev_cli_env
        jetbrains.idea-community
        mysql-workbench
        vscode
      ];
    };

    dev_cli_env = with pkgs; buildEnv {
      name = "dev-cli-env";
      paths = [
        ammonite
        my_vim
        gitFull
        go
        python
        ripgrep
        rustup
        scala
        sbt
        stack
      ];
    };

    basic_gui_env = with pkgs; buildEnv {
      name = "basic-gui-env";
      paths = [
        alacritty
        awesome
        cli_utils
        cups
        evince
        firefox
        my_fonts
        gnome3.file-roller
        gui_utils
        lightdm
        pasystray
        pavucontrol
        powerline-fonts
        qutebrowser
        st
        termite
        thunderbird
        xfce.thunar
        xfce.thunar_volman
        gksu
        xorg.setxkbmap
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
        bind
        dmidecode
        exfat-utils
        file
        fzf
        htop
        iotop
        lsof
        lm_sensors
        pciutils
        psmisc
        pv
        stow
        tree
        tmux
        usbutils
        unzip
        xxd
      ];
    };

    gui_utils = with pkgs; buildEnv {
      name = "gui-utils";
      paths = [
        baobab
        gparted
        glxinfo
        xorg.xev
      ];
    };

    internet_prgms = with pkgs; buildEnv {
      name = "internet-pgrms";
      paths = [
        transmission_remote_gtk
        remmina
      ];
    };

    media_text = with pkgs; buildEnv {
      name = "media-text";
      paths = [
        calibre
        libreoffice
        open-dyslexic
        pandoc
        texlive.combined.scheme-full
      ];
    };

    media_picture = import ./media/picture { inherit pkgs;};
    media_sound = import ./media/sound { inherit pkgs;};
    media_video = import ./media/video { inherit pkgs;};

    games = with pkgs; buildEnv {
      name = "games";
      paths = [
        steam
      ];
    };

    accounting = with pkgs; buildEnv {
      name = "accounting";
      paths = [
        gnucash26
      ];
    };
  };
}
