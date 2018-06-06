{
  allowUnfree = true;

  hardware.opengl.driSupport32Bit = true;
  permittedInsecurePackages = [
    "webkitgtk-2.4.11"
  ];

  packageOverrides = bootstrap:
    let
      loadPkgs = import ./loadPkgs.nix;
      oldStable = loadPkgs bootstrap ./oldstable.json;
      stable = loadPkgs bootstrap ./stable.json;
      unstable = loadPkgs bootstrap ./unstable.json;
    in with stable; {
    dev-all = import ./packages/dev { inherit oldStable stable unstable; };

    home_laptop = buildEnv {
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

    home_server = buildEnv {
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


    home_gui = buildEnv {
      name = "home-gui";
      paths = [
        accounting
        basic_gui_env
        dev_gui_env
        games
        internet_prgms
        media_picture
        media_sound
        media_video.media_video
        media_text
      ];
    };

    mics_desktop = buildEnv {
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
        unstable.nodePackages.node2nix
        nodejs
        phantomjs2
        ruby_2_4
        vagrant
      ];
    };

    my_fonts = import ./my_fonts.nix { inherit oldStable stable unstable;};

    dev_gui_env = buildEnv {
      name = "dev-gui-env";
      paths = [
        atom
        dev_cli_env
        mysql-workbench
        vscode
      ];
    };

    dev_cli_env = buildEnv {
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

    basic_gui_env = buildEnv {
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
        urxvt_font_size
        xfce.thunar
        xfce.thunar_volman
        gksu
        xorg.setxkbmap
        xscreensaver
      ];
    };

    basic_env = buildEnv {
      name = "basic-env";
      paths = [
        cli_utils
        zsh
      ];
    };

    cli_utils = buildEnv {
      name = "cli-utils";
      paths = [
        bind
        dmidecode
        exfat-utils
        file
        fzf
        htop
        keychain
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
        usbutils
        unzip
        xxd
      ];
    };

    gui_utils = buildEnv {
      name = "gui-utils";
      paths = [
        baobab
        gparted
        glxinfo
        xorg.xev
      ];
    };

    internet_prgms = buildEnv {
      name = "internet-pgrms";
      paths = [
        transmission_remote_gtk
        remmina
      ];
    };


    media_picture = import ./packages/media/picture { inherit oldStable stable unstable;};
    media_sound = import ./packages/media/sound { inherit oldStable stable unstable;};
    media_video = import ./packages/media/video { inherit oldStable stable unstable;};
    media_text = import ./packages/media/text { inherit oldStable stable unstable;};

    games = buildEnv {
      name = "games";
      paths = [
        steam
      ];
    };

    accounting = buildEnv {
      name = "accounting";
      paths = [
        gnucash26
      ];
    };
  };
}
