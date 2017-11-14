{
  allowUnfree = true;

  hardware.opengl.driSupport32Bit = true;
  permittedInsecurePackages = [
    "webkitgtk-2.4.11"
  ];

  packageOverrides = pkgs_: with pkgs_; {
    my_vim = import ./vim-config { inherit pkgs ; };

    home_laptop = with pkgs; buildEnv {
      name = "home-laptop";
      paths = [
        basic_home
        blueman
        cbatticon
        networkmanagerapplet
        rfkill
        wirelesstools
        xorg.xbacklight
      ];
    };

    basic_home = with pkgs; buildEnv {
      name = "basic-home";
      paths = [
        accounting
        basic_gui_env
        dev_env
        games
        internet_prgms
        media_picture
        media_sound
        media_video
      ];
    };

    dev_env = with pkgs; buildEnv {
      name = "dev-env";
      paths = [
        atom
        my_vim
        git
        go
        jetbrains.idea-community
        python
        ripgrep
        scala
        sbt
        stack
        vscode
      ];
    };

    mics_desktop = with pkgs; buildEnv {
      name = "mics-desktop";
      paths = [
        basic_gui_env
        dev_env
        google-drive-ocamlfuse
        jq
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
        cups
        evince
        firefox
        gnome3.file-roller
        gui_utils
        lightdm
        pasystray
        pavucontrol
        powerline-fonts
        termite
        thunderbird
        xfce.thunar
        xfce.thunar_volman
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
        fzf
        htop
        lsof
        pciutils
        pv
        stow
        tree
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

    media_picture = with pkgs; buildEnv {
      name = "media-picture";
      paths = [
        feh
        gphoto2
        gimp
        rawtherapee
        shotwell
        ufraw
        xfce.ristretto
      ];
    };

    media_sound = with pkgs; buildEnv {
      name = "media-sound";
      paths = [
        clementine
      ];
    };

    media_video = with pkgs; buildEnv {
      name = "media-video";
      paths = [
        kodi
        mpv
        smplayer
        vdpauinfo
        vlc
      ];
    };

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
