{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    discord
    nodejs
    emacs-pgtk
  ];
}
