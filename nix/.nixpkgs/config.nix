{
  allowUnfree = true;

  hardware.opengl.driSupport32Bit = true;
  permittedInsecurePackages = [
    "webkitgtk-2.4.11"
  ];

  packageOverrides = pkgs_: with pkgs_; {
    dev-all = import ./packages/dev { inherit pkgs ; };

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
        phantomjs2
        ruby_2_4
        vagrant
      ];
    };

    my_fonts = import ./my_fonts.nix { inherit pkgs;};

    dev_gui_env = with pkgs; buildEnv {
      name = "dev-gui-env";
      paths = [
        atom
        dev_cli_env
        mysql-workbench
        vscode
      ];
    };

    dev_cli_env = with pkgs; buildEnv {
      name = "dev-cli-env";
      paths = [
        dev-all
        gitFull
        go
        python
        ripgrep
        rustup
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
        rxvt_unicode
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
        lshw
        lsof
        lm_sensors
        pciutils
        psmisc
        pv
        stow
        tree
        tmux
        virtmanager
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


    media_picture = import ./packages/media/picture { inherit pkgs;};
    media_sound = import ./packages/media/sound { inherit pkgs;};
    media_video = import ./packages/media/video { inherit pkgs;};
    media_text = import ./packages/media/text { inherit pkgs;};

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
