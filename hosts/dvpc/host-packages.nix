{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    discord
    keyd
    nodejs
  ];
}
