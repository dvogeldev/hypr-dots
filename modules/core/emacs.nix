{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ((emacsPackagesFor emacs-pgtk).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))
    (emacs-pgtk.override {
      withImageMagick = true;
      withRSVG = true;
    })
    # Needed for doom
    aspell
    aspellDicts.en
    fd
    fzf
    librsvg # add svg support
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
