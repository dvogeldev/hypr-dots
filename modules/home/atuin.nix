{ config, ... }:
{
  programs.atuin = {
    enable = true;

    enableFishIntegration = true;

    settings = {
      # Sync configuration
      auto_sync = true;
      sync_frequency = "5m"; # More frequent than default 1h
      sync_address = "https://api.atuin.sh";
      # TODO add session_path and key_path for reproducibility REQ. Sops nix, etc

      # Search and filtering
      search_mode = "fuzzy";
      filter_mode = "global";
      search_mode_shell_up_key_binding = "fuzzy";
      filter_mode_shell_up_key_binding = "session"; # More focused for up-key
      workspaces = true; # Enable git workspace filtering

      # UI preferences
      style = "auto"; # Adapts to terminal size
      inline_height = 25; # Reasonable height limit
      show_preview = true;
      max_preview_height = 6; # Show more context
      show_help = true;
      show_tabs = true;
      invert = false; # Search bar at bottom (traditional)

      # Behavior
      enter_accept = true; # Execute immediately on enter
      exit_mode = "return-original";
      keymap_mode = "auto"; # Adapt to shell keymap

      # Performance and timeouts
      network_timeout = 10; # Increased for better reliability
      network_connect_timeout = 8;
      local_timeout = 5;

      # Security and filtering
      secrets_filter = true; # Filter out secrets automatically
      update_check = true;

      # History filtering - customize as needed
      history_filter = [
        "^secret"
        "^export.*SECRET"
        "^export.*PASSWORD"
        "^export.*TOKEN"
        ".*--password.*"
        ".*--token.*"
      ];

      # Stats configuration for better command analysis
      stats = {
        common_subcommands = [
          "apt"
          "cargo"
          "docker"
          "git"
          "kubectl"
          "nix"
          "nixos-rebuild"
          "home-manager"
          "systemctl"
          "journalctl"
          "tmux"
        ];
        common_prefix = [ "sudo" ];
        ignored_commands = [
          "cd"
          "cl"
          "fr"
          "fu"
          "ls"
          "ll"
          "la"
          "pwd"
          "clear"
          "exit"
        ];
      };

      # Key bindings
      keys = {
        scroll_exits = false; # Don't exit on scroll past bounds
      };

      # Preview settings
      preview = {
        strategy = "auto"; # Dynamic preview height
      };

      # Sync v2 (recommended for new installs)
      sync = {
        records = true;
      };
    };
  };
}
