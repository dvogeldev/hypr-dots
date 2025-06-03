{pkgs, ...}: {
  home.packages = with pkgs; [ fish ];

  home.file."./.fishrc-personal".text = ''

  # This file allows you to define your own aliases, functions, etc
  # below are just some examples of what you can use this file for

    #!/usr/bin/env fish
    # Set defaults
    #
    #set -gx EDITOR "nvim"
    #set -gx VISUAL "nvim"

    #alias c "clear"

  '';
}
