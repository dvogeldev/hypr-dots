{ pkgs, ... }:
{
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = "brave-browser.desktop";
        "x-scheme-handler/https" = "brave-browser.desktop";
      };
    };
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk # Recommended for file pickers in GTK apps
        # xdg-desktop-portal-kde # If you use KDE applications
      ];
      # Ensure xdg-open uses the portal system
      xdgOpenUsePortal = true;
    };
  };
}
