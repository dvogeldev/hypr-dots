{
  pkgs,
  inputs,
  ...
}:
{
  programs = {
    hyprland.enable = true; # someone forgot to set this so desktop file is created
    dconf.enable = true;
    seahorse.enable = true;
    fish.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    adb.enable = true;
    hyprlock.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    amfora # Fancy Terminal Browser For Gemini Protocol
    appimage-run # Needed For AppImage Support
    bottom # rust based terminal monitor
    brave # Brave Browser
    brightnessctl # For Screen Brightness Control
    cliphist # Clipboard manager using rofi menu
    # TODO docker-compose # Allows Controlling Docker From A Single File
    dbus
    direnv
    duf # Utility For Viewing Disk Usage In Terminal
    easyeffects # Audio effects for Pipewire
    editorconfig-core-c
    eza # Beautiful ls Replacement
    ffmpeg # Terminal Video / Audio Editing
    file-roller # Archive Manager
    freetube # FOSS youTube Player
    gimp # Great Photo Editor
    glxinfo # needed for inxi diag util
    glibc # 4 codellm
    greetd.tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
    hyprpicker # Color Picker
    eog # For Image Viewing
    inxi # CLI System Information Tool
    killall # For Killing All Instances Of Programs
    libnotify # For Notifications
    lm_sensors # Used For Getting Hardware Temps
    lolcat # Add Colors To Your Terminal Command Output
    lshw # Detailed Hardware Information
    mpv # Incredible Video Player
    ncdu # Disk Usage Analyzer With Ncurses Interface
    nixfmt-rfc-style # Nix Formatter
    nspr # 4 codellm
    nss # 4 codellm
    nwg-displays # configure monitor configs via GUI
    onefetch # provides zsaneyos build info on current system
    pavucontrol # For Editing Audio Levels & Devices
    pciutils # Collection Of Tools For Inspecting PCI Devices
    picard # For Changing Music Metadata & Getting Cover Art
    pkg-config # Wrapper Script For Allowing Packages To Get Info On Others
    playerctl # Allows Changing Media Volume Through Scripts
    prettierd # Prettier, as a daemon, for improved formatting speed
    ripgrep # Improved Grep
    socat # Needed For Screenshots
    tealdeer # A very fast implementation of tldr in Rust.
    unrar # Tool For Handling .rar Files
    unzip # Tool For Handling .zip Files
    usbutils # Good Tools For USB Devices
    wget # Tool For Fetching Files With Links
    ytmdl # Tool For Downloading Audio From YouTube
    yt-dlp # youTube video downloader
  ];
}
