{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ((emacsPackagesFor emacs-pgtk).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))
    # Needed for doom
    aspell
    aspellDicts.en
    fd
    fzf
    nixfmt-rfc-style # nix formatter updated to latest spec
    nil # lsp for nix
    pandoc
    ripgrep
    shellcheck
  ];

  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  environment.variables = {
    EDITOR = "${pkgs.emacs-pgtk}/bin/emacsclient -c";
    ALTERNATE_EDITOR = "${pkgs.neovim}/bin/neovim";
  };
}
