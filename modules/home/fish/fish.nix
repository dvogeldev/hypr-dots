{
  config,
  pkgs,
  profile,
  ...
}:
{
  imports = [ ./aliases.nix ];

  programs.fish = {
    enable = true;
    shellInit = ''
      set -u fish_greeting ""
      fish_vi_key_bindings
    '';
    # interactiveShellInit is for commands that should run only for interactive shells
    interactiveShellInit = ''
      # Add ~/.local/bin to PATH
      fish_add_to_path ~/.local/bin
      
      # Environment variables
      set -gx TERMINAL "ghostty"
      set -gx EDITOR "emacsclient -c -a 'Emacs'"
      set -gx BROWSER "brave"
      set -gx manpager "batman"
      set -gx GDK_SCALE "1"
      set -gx QT_SCALE_FACTOR "1"
      set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
      gpgconf --launch gpg-agent
    '';

    plugins = [
      {
        name = "done";
        src = pkgs.fishPlugins.done;
      }
      {
        name = "fzf";
        src = pkgs.fishPlugins.fzf.src;
      }
      {
        name = "puffer";
        src = pkgs.fishPlugins.puffer.src;
      }
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
      {
        name = "foreign environment";
        src = pkgs.fishPlugins.foreign-env.src;
      }
    ];
  };
}