# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "fr";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "fr";

  services.xserver.xkbOptions = "ctrl:nocaps";
  
  # Enable CUPS to print documents.
  services.printing.enable = true;

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
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simon = {
    isNormalUser = true;
    description = "Simon";
    extraGroups = [ "networkmanager" "wheel"];
    packages = with pkgs; [
      firefox
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  bash
  git
  tmux
  vscode
  spotify
  bitwarden
  bitwarden-cli

  # Golang
  go

  # Docker Environment
  docker
  docker-compose

  # Communications
  discord
  ];
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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

  # Enable docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = ["simon"];

  programs.tmux = {
    enable = true;
    shortcut = "a";
    # aggressiveResize = true; -- Disabled to be iTerm-friendly
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
    ];

    extraConfig = ''
      # Set ctrl-a for prefix
      unbind C-b
      set -g prefix C-a
      bind C-a send-prefix

      # Set ctrl-a to reload config
      bind r source-file ~/.tmux.conf

      # Set XTerm key bindings
      setw -g xterm-keys on

      # Set tmux vi mode
      set-window-option -g mode-keys vi

      # Enable mouse
      set -g mouse on

      # Scroll History
      set -g history-limit 50000

      # Set ability to capture on start and restore on exit window data when running an application
      setw -g alternate-screen on

      # Status bar customization
      set -g status off

      # Set escape-time for escape key
      set-option -sg escape-time 10

      # Install tpm if it isn't already installed
      if "test ! -d ~/.tmux/plugins/tpm" \
        "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

      # List of plugins
      set -g @plugin 'tmux-plugins/tpm'
      set -g @plugin 'tmux-plugins/tmux-sensible'
      set -g @plugin 'tmux-plugins/tmux-resurrect'
      set -g @plugin 'tmux-plugins/tmux-continuum'
      set -g @plugin 'tmux-plugins/tmux-pain-control'

      # Activate continuum
      set -g @continuum-restore 'on'
      set -g @continuum-save-interval '5'

      # New pane and window on the same directory
      bind - split-window -c "#{pane_current_path}"
      bind | split-window -h -c "#{pane_current_path}"
      bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel 'xclip -se c -i'
      bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel 'xclip -se c -i'

      # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
      run -b '~/.tmux/plugins/tpm/tpm'
    '';
  };
  
  

  environment.interactiveShellInit = ''
    alias gs='git status'
    alias michel='nix-shell'
  '';

}
