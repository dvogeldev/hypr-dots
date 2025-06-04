{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ((emacsPackagesFor emacs-pgtk).emacsWithPackages (epkgs: [
      epkgs.vterm
    ]))
    # Needed for doom
    aspell
    aspellDicts.en
    cmake
    fd
    fzf
    gnumake
    libvterm
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
