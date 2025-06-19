{ host, ... }:
let
  inherit (import ../../hosts/${host}/variables.nix) waybarChoice;
in
{
  imports = [
    ./amfora.nix
    ./atuin.nix
    ./bash.nix
    ./bashrc-personal.nix
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./easyeffects.nix
    ./emoji.nix
    ./eza.nix
    ./fastfetch
    ./fish
    ./fonts.nix
    ./fuzzel.nix
    ./fzf.nix
    ./gh.nix
    ./ghostty.nix
    ./git.nix
    ./gtk.nix
    ./htop.nix
    ./hyprland
    ./kitty.nix
    ./lazygit.nix
    # ./nvf.nix
    ./qutebrowser.nix
    ./qt.nix
    # ./rofi
    ./scripts
    # ./starship.nix
    ./stylix.nix
    ./swappy.nix
    ./swaync.nix
    ./tldr.nix
    ./virtmanager.nix
    ./wezterm.nix
    ./wlogout
    ./xdg.nix
    ./yazi
    ./zoxide.nix
    ./zsh
    waybarChoice
  ];
}
