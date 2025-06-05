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
      # Environment variables
      set -gx TERMINAL "ghostty"
      set -gx EDITOR "emacsclient -c -a 'Emacs'"
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
        src = pkgs.fishPlugins.fzf;
      }
      {
        name = "puffer";
        src = pkgs.fishPlugins.puffer;
      }
      {
        name = "tide";
        src = pkgs.fishPlugins.tide;
      }
      {
        name = "foreign environment";
        src = pkgs.fishPlugins.foreign-env;
      }
    ];
  };
}
