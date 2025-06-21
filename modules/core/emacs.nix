{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (
      (emacsPackagesFor (
        emacs-pgtk.overrideAttrs (oldAttrs: {
          configureFlags = oldAttrs.configureFlags ++ [
            "--disable-build-details"
            "--with-modules"
            "--with-pgtk"
            "--with-compress-install"
            "--with-toolkit-scroll-bars"
            "--with-native-compilation"
            "--with-imagemagick"
            "--with-rsvg"
            "--with-mailutils"
            "--without-small-ja-dic"
            "--with-tree-sitter"
            "--without-xinput2"
            "--without-xwidgets"
            "--with-dbus"
            "--with-selinux"
          ];
          buildInputs = oldAttrs.buildInputs ++ [
            pkgs.imagemagick
            pkgs.librsvg
          ];
        })
      )).emacsWithPackages
      (epkgs: [
        epkgs.vterm
      ])
    )
    # Needed for doom
    aspell
    aspellDicts.en
    fd
    fzf
    graphviz
    nixfmt-rfc-style # nix formatter updated to latest spec
    nil # lsp for nix
    pandoc
    python3
    ripgrep
    shellcheck
    nodejs # For Javascript runtime and npm
    # Language servers for web development
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted # Provides servers for HTML, CSS, JSON
  ];

  # Required for Emacs native compilation to find libraries
  programs.nix-ld.enable = true;

  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  environment.variables = {
    EDITOR = "${pkgs.emacs-pgtk}/bin/emacsclient -c";
    ALTERNATE_EDITOR = "${pkgs.neovim}/bin/neovim";
  };
}
