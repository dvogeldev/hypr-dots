{pkgs, ...}: {
  environment.systemPackages = with pkgs; [fontconfig];

  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      poppins
      font-awesome
      nerd-fonts.hasklug
      nerd-fonts.symbols-only
      nerd-fonts.jetbrains-mono
      noto-fonts-color-emoji
      liberation_ttf
      maple-mono.NF
      symbola
      material-icons
      fira-code
      fira-code-symbols
    ];
  };
}
