{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
    meld
    keyd
    nodejs
  ];
}
