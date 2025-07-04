{
  pkgs,
  host,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix) stylixImage;
in
{
  # Styling Options
  stylix = {
    enable = true;
    image = stylixImage;
    base16Scheme = {
      # Tokyo Night Dark
      base00 = "#1A1B26";
      base01 = "#16161E";
      base02 = "#2F3549";
      base03 = "#444B6A";
      base04 = "#787C99";
      base05 = "#A9B1D6";
      base06 = "#CBCCD1";
      base07 = "#D5D6DB";
      base08 = "#C0CAF5";
      base09 = "#A9B1D6";
      base0A = "#0DB9D7";
      base0B = "#9ECE6A";
      base0C = "#B4F9F8";
      base0D = "#2AC3DE";
      base0E = "#BB9AF7";
      base0F = "#F7768E";
    };
    polarity = "dark";
    opacity.terminal = 1.0;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        # package = pkgs.nerd-fonts.jetbrains-mono;
        package = pkgs.maple-mono.NF;
        # name = "JetBrains Mono";
        name = "Maple Mono NF";
      };
      sansSerif = {
        package = pkgs.poppins;
        name = "Poppins";
      };
      serif = {
        package = pkgs.liberation_ttf;
        name = "Liberation Serif";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };
  };
}
