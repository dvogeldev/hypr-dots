{pkgs, ...}: {
  home.packages = with pkgs; [fish];

  home.file."./.fishrc-personal".text = ''

      #!/usr/bin/env fish
    set -gx GDK_SCALE "1"
    set -gx QT_SCALE_FACTOR "1"

  '';
}
