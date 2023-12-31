# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
      (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.consoleLogLevel = 0;
  # boot.initrd.systemd.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # plymouth
  # boot.plymouth.enable = true;
  #boot.plymouth.theme = "mocha";  
  boot.kernelParams = [
    # "quiet"
    # "splash"
    "verbose"
  ];

  networking.hostName = "nixo"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the Cinnamon Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.cinnamon.enable = true;
  # Hyprland
  programs.hyprland.enable = true;
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });
  };
  
  environment.variables = {
    #"QT_STYLE_OVERRIDE"="kvantum";
    #"QT_QPA_PLATFORMTHEME"="qt5ct";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gamingguy003 = {
    isNormalUser = true;
    description = "gamingguy003";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # fish shell
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  environment.shells = [
    pkgs.fish
  ];
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  # flatpak
  services.flatpak.enable = true;
  xdg.portal.enable = true;

  # pwfeedback
  security.sudo.configFile = ''
  Defaults pwfeedback
  '';

  # mesa
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.xserver.videoDrivers = [
    "modesetting"
    "vulkan"
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # vscode server
  services.vscode-server.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    helix
    pfetch
    discord
    google-chrome
    htop
    ranger
    spotify
    prismlauncher
    speedtest-cli
    mesa
    intel-media-driver
    rustup
    gcc
    git
    libreoffice-fresh
    nextcloud-client
    gnome.evince
    gnome.cheese
    gnome.dconf-editor
    gthumb
    whatsapp-for-linux
    # bottles
    # graphics
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
    # hyprland
    kitty
    wofi
    cinnamon.nemo
    themechanger
    pamixer
    gnome.gucharmap
    light
    networkmanagerapplet
    hyprpaper
    libsForQt5.qtstyleplugin-kvantum
    qtstyleplugin-kvantum-qt4
    pavucontrol
    glib
    grim
    slurp
    gsettings-desktop-schemas
    # vscode
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        ms-vscode-remote.remote-ssh
        rust-lang.rust-analyzer
        serayuzgur.crates
        bungcip.better-toml
        dracula-theme.theme-dracula
        christian-kohler.path-intellisense
        piousdeer.adwaita-theme
      ];
    })
  ];

  
  fonts.fonts = with pkgs; [
    proggyfonts
    emojione
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira
    fira-code
    fira-mono
    iosevka
    hack-font
    terminus_font
    anonymousPro
    freefont_ttf
    corefonts
    dejavu_fonts
    inconsolata
    ubuntu_font_family
    ttf_bitstream_vera
    nerdfonts
    terminus-nerdfont
    font-awesome
    font-awesome_5
    font-awesome_4
  ];

  home-manager.users.gamingguy003 = { pkgs, ... }: {
    home = {
      stateVersion = "23.11"; # System version upon creation
      #pointerCursor = {
      #  name = "Catppuccin-Frappe-Blue-Cursors";
      #  package = pkgs.catppuccin-cursors;
      #  size = 12;
      #  gtk.enable = true;
      #};
      #sessionVariables.GTK_THEME = "Catppuccin-Frappe-Standard-Lavender-Dark";      
    };

    qt = {
      enable = true;

      platformTheme = "gtk";
    };
    
    gtk = {
      enable = true;
      
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders;
      };

      cursorTheme = {
        name = "Catppuccin-Frappe-Blue-Cursors";
        package = pkgs.catppuccin-cursors;
      };

      theme = {
        name = "Adwaita-dark";
      };
      
      gtk3.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=true
        '';
      };

      gtk4.extraConfig = {
        Settings = ''
          gtk-application-prefer-dark-theme=true
        '';
      };
    };
  }; 
}

