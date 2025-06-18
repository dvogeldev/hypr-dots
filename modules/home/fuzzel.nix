{
  host,
  config,
  pkgs,
  ...
}:
let
  inherit (import ../../../hosts/${host}/variables.nix) terminal;
in
{
  # home.packages = with pkgs; [
  #   fuzzel
  # ];

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        # Appearance
        # font = "monospace:size=12";
        dpi-aware = "yes";
        prompt = "> ";
        icon-theme = "Papirus";
        show-actions = "yes";
        terminal = "$terminal";

        # Layout
        width = 40;
        horizontal-pad = 20;
        vertical-pad = 8;
        inner-pad = 8;

        # Behavior
        fuzzy = "yes";
        filter-desktop = "no";
        no-exit-on-keyboard-focus-loss = "no";
      };

      # colors = {
      #   # Using stylix colors for consistency
      #   # background = "${config.lib.stylix.colors.base00}dd";
      #   text = "${config.lib.stylix.colors.base05}ff";
      #   match = "${config.lib.stylix.colors.base08}ff";
      #   selection = "${config.lib.stylix.colors.base02}ff";
      #   selection-text = "${config.lib.stylix.colors.base05}ff";
      #   selection-match = "${config.lib.stylix.colors.base08}ff";
      #   border = "${config.lib.stylix.colors.base08}ff";
      # };

      border = {
        width = 2;
        radius = 10;
      };
    };
  };
}
