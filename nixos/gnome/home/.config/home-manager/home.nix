{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "gamingguy003";
  home.homeDirectory = "/home/gamingguy003";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  # home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  # ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/gamingguy003/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    QT_QPA_PLATFORM = "wayland";
    EDITOR = "hx";
  };

  programs.git = {
    enable = true;
    userName = "GamingGuy003";
    userEmail = "gamingguy003@mail.com";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  home.packages = (with pkgs; [
      # gnome stuff
      gnome.gnome-tweaks
      gnome.dconf-editor
      gnome-extension-manager
      # cli
      pfetch
      htop
      btop
      ffmpeg
      # web
      librewolf
      discord
      nextcloud-client
      whatsapp-for-linux
      schildichat-desktop
      spotify
      # diverse
      kitty
      marktext
      bitwarden
      libreoffice
      dialect
      teams-for-linux
      remmina
      # Hyprland
      wofi
      hyprpaper
      # games
      prismlauncher
      steam-run
      rare
      bottles
      # vscode
      (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
          # rust
          rust-lang.rust-analyzer
          serayuzgur.crates
          tamasfe.even-better-toml
          piousdeer.adwaita-theme
          # java
          redhat.java
          # VisualStudioExptTeam.vscodeintellicode
          vscjava.vscode-java-dependency
          vscjava.vscode-java-test
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "vscodeintellicode";
            publisher = "VisualStudioExptTeam";
            version = "1.2.30";
            sha256 = "f2Gn+W0QHN8jD5aCG+P93Y+JDr/vs2ldGL7uQwBK4lE=";
          }
        ];
      })
      # tools
      openshot-qt
    ]) ++ (with pkgs.gnomeExtensions; [
      workspace-indicator-2
      appindicator
      just-perfection
      battery-time-2
      blur-my-shell
      clipboard-indicator
      gsconnect
      just-perfection
      media-controls
      rounded-window-corners
      unite
    ]);

  # gtk.enable = true;
  qt.enable = true;
  qt.platformTheme = "gtk";
  qt.style.name = "adwaita-dark";
}
