{ host, ... }:
let
  inherit (import ../../../hosts/${host}/variables.nix)
    browser
    terminal
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Core Applications
      "$modifier,Return,exec,${terminal}"
      "$modifier,W,exec,${browser}"
      "$modifier,E,exec,emacsclient -c -n"
      "$modifier,Y,exec,ghostty -e yazi"
      "$modifier,D,exec,discord"
      "$modifier,G,exec,gimp"
      "$modifier,O,exec,codellm"

      # System Controls
      "$modifier,Q,killactive"
      "$modifier SHIFT,Q,exec,wlogout" # Logout menu
      "$modifier SHIFT,C,exit,"
      "$modifier SHIFT,R,exec, hyprctl reload" # Reload Config

      # Launchers & Tools
      "$modifier SHIFT,Return,exec,fuzzel" # Changed from rofi
      "$modifier,K,exec,list-keybinds"
      "$modifier,S,exec,screenshootin"
      "$modifier,C,exec,hyprpicker -a"
      "$modifier,V,exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy" # Changed from rofi
      "$modifier,M,exec,pavucontrol"
      "$modifier,T,exec,pypr toggle term" # TODO: What is pypr, seems like a scratchpad term

      # Window Management (vim keys only)
      "$modifier,h,movefocus,l"
      "$modifier,l,movefocus,r"
      "$modifier,k,movefocus,u"
      "$modifier,j,movefocus,d"

      "$modifier SHIFT,h,movewindow,l"
      "$modifier SHIFT,l,movewindow,r"
      "$modifier SHIFT,k,movewindow,u"
      "$modifier SHIFT,j,movewindow,d"

      "$modifier ALT, left, swapwindow,l"
      "$modifier ALT, right, swapwindow,r"
      "$modifier ALT, up, swapwindow,u"
      "$modifier ALT, down, swapwindow,d"

      # Layout Controls
      "$modifier,F,fullscreen,"
      "$modifier SHIFT,F,togglefloating,"
      "$modifier,P,pseudo," # TODO: What is pseudo? Is it floating?
      "$modifier SHIFT,I,togglesplit,"
      "$modifier,R,submap,resize" # Toggle resize

      # Workspaces
      "$modifier,Tab,workspace,previous" # Quick workspace switch
      # Shift workspaces
      "$modifier,1,workspace,1"
      "$modifier,2,workspace,2"
      "$modifier,3,workspace,3"
      "$modifier,4,workspace,4"
      "$modifier,5,workspace,5"
      "$modifier,6,workspace,6"
      "$modifier,7,workspace,7"
      "$modifier,8,workspace,8"
      "$modifier,9,workspace,9"
      "$modifier,0,workspace,10"
      # Move to workspace
      "$modifier SHIFT,1,movetoworkspace,1"
      "$modifier SHIFT,2,movetoworkspace,2"
      "$modifier SHIFT,3,movetoworkspace,3"
      "$modifier SHIFT,4,movetoworkspace,4"
      "$modifier SHIFT,5,movetoworkspace,5"
      "$modifier SHIFT,6,movetoworkspace,6"
      "$modifier SHIFT,7,movetoworkspace,7"
      "$modifier SHIFT,8,movetoworkspace,8"
      "$modifier SHIFT,9,movetoworkspace,9"
      "$modifier SHIFT,0,movetoworkspace,10"
      "$modifier CONTROL,right,workspace,e+1"
      "$modifier CONTROL,left,workspace,e-1"
      "$modifier,mouse_down,workspace, e+1"
      "$modifier,mouse_up,workspace, e-1"
      "ALT,Tab,cyclenext"
      "ALT,Tab,bringactivetotop"

      # Special Workspace
      "$modifier SHIFT,SPACE,movetoworkspace,special" # TODO: What is the special workspace?
      "$modifier,SPACE,togglespecialworkspace" # TODO: What is it?

      # Utilities
      "$modifier SHIFT,W,exec,web-search" # Websearch via engines
      "$modifier ALT,W,exec,wallsetter"
      "$modifier SHIFT,N,exec,swaync-client -rs" # TODO: Figure out what this does
      "$modifier SHIFT,E,exec,emopicker9000"
      "$modifier ALT,F,workspaceopt, allfloat"

      # Media keys
      ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPrev, exec, playerctl previous"
      ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
      ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
    ];

    bindm = [
      "$modifier, mouse:272, movewindow"
      "$modifier, mouse:273, resizewindow"
    ];
  };
}