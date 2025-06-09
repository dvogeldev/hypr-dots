{
  pkgs,
  emacs-overlay,
  nix-doom-emacs,
  ...
}:

let
  customEmacs = pkgs.emacsPgtkGcc.overrideAttrs (oldAttrs: {
    # Add performance and feature flags
    configureFlags = oldAttrs.configureFlags ++ [
      "--with-cairo" # For better 2D graphics rendering
      "--with-xwidgets" # For embedding webkit views in Emacs
      "--with-modules" # For loading dynamic modules
    ];
    # Set compiler and linker flags for optimization and debugging
    CFLAGS = "-O2 -g";
    CXXFLAGS = "-O2 -g";
    LDFLAGS = "-ggdb3";
    # Add build dependencies to support the flags
    buildInputs =
      oldAttrs.buildInputs
      ++ (with pkgs; [
        cairo
        webkitgtk
        libgccjit # Crucial for native compilation
        jansson # Fast JSON parser used by LSP
        tree-sitter

        # Image support for a full graphical experience
        libjpeg
        libpng
        giflib
        libtiff
        librsvg # For SVG support
      ]);
  });
in
{
  # Apply the emacs-overlay to access Wayland-native builds
  nixpkgs.overlays = [ emacs-overlay.overlay ];

  # 2. Integrate Doom Emacs using nix-doom-emacs
  programs.doom-emacs = {
    enable = true;
    emacsPackage = customEmacs; # Use our custom Emacs build
    # Point to your Doom Emacs private config directory
    doomPrivateDir = ./doom;
  };

  # 5. Set up Emacs as a systemd user service for daemon mode
  services.emacs = {
    enable = true;
    package = customEmacs; # Ensure the service uses the same Emacs build
    client.enable = true; # Creates `emacsclient` wrapper for easy access
  };

  # Set environment variables for a pure Wayland session
  home.sessionVariables = {
    GDK_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1"; # For Firefox if using xwidgets
  };
}
