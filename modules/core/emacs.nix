{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    emacs-pgtk
    # Needed for doom
    fd
    fzf
    ripgrep
    libvterm
    cmake
    aspell
    aspellDicts.en
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
