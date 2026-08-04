{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./bar.nix ];

  home.file.".config/i3/scripts/lock.sh" = {
    source = ./scripts/lock.sh;
    executable = true;
  };

  xsession.windowManager.i3 = {
    enable = true;
    extraConfig = '''';
    config = {
      modifier = "Mod4";
      fonts = {
        names = [ "JetBrainsMono Nerd Font" ];
        size = 10.0;
      };
      gaps = {
        inner = 10;
        outer = 5;
      };
      window = {
        border = 2;
        titlebar = false;
      };

      colors = {
        focused = {
          border = "#89b4fa";
          background = "#89b4fa";
          text = "#1e1e2e";
          indicator = "#89b4fa";
          childBorder = "#89b4fa";
        };
        focusedInactive = {
          border = "#313244";
          background = "#313244";
          text = "#cdd6f4";
          indicator = "#313244";
          childBorder = "#313244";
        };
        unfocused = {
          border = "#1e1e2e";
          background = "#1e1e2e";
          text = "#cdd6f4";
          indicator = "#1e1e2e";
          childBorder = "#1e1e2e";
        };
        urgent = {
          border = "#f38ba8";
          background = "#f38ba8";
          text = "#1e1e2e";
          indicator = "#f38ba8";
          childBorder = "#f38ba8";
        };
      };

      startup = [
        {
          command = "feh --bg-fill ~/Pictures/wallpaper/current.jpg || feh --bg-fill ~/Pictures/wallpaper/1.jpg || feh --bg-solid '#282828'";
          always = true;
          notification = false;
        }
        {
          command = "~/.config/polybar/launch.sh";
          always = true;
          notification = false;
        }
      ];

      bars = [ ];

      modes = {
        power_menu = {
          "s" = "exec systemctl poweroff, mode \"default\"";
          "r" = "exec systemctl reboot, mode \"default\"";
          "z" = "exec systemctl suspend, exec eww close-all, mode \"default\"";
          "l" = "exec ~/.config/i3/scripts/lock.sh, exec eww close-all, mode \"default\"";
          "e" = "exec i3-msg exit, mode \"default\"";
          "Escape" = "exec eww close-all, mode \"default\"";
          "Return" = "mode \"default\"";
        };
        widget_mode = {
          "Escape" = "exec eww close-all, mode \"default\"";
          "Return" = "mode \"default\"";
        };
        resize = {
          "h" = "resize shrink width 10 px or 10 ppt";
          "j" = "resize grow height 10 px or 10 ppt";
          "k" = "resize shrink height 10 px or 10 ppt";
          "l" = "resize grow width 10 px or 10 ppt";
          "Left" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";
          "Escape" = "mode \"default\"";
          "Return" = "mode \"default\"";
        };
      };

      keybindings = lib.mkOptionDefault {
        "Mod4+r" = "mode \"resize\"";
        "Mod4+Shift+r" = "restart";
        "Mod4+Return" = "exec kitty";
        "Mod4+a" = "exec rofi -show drun";
        "Mod4+e" = "exec thunar";
        "Mod4+w" = "exec firefox";
        "Mod4+Shift+w" = "exec rofi-wallpaper";
        "Mod4+x" = "exec kitty nvim";
        "Mod4+Shift+t" = "exec kitty btop";
        "Mod4+Shift+c" = "exec kitty cava";
        "Mod4+q" = "kill";
        "Mod4+f" = "fullscreen toggle";
        "Mod4+Shift+space" = "floating toggle";
        "Mod4+Shift+s" = "exec flameshot gui";

        "Mod4+Control+l" = "exec ~/.config/i3/scripts/lock.sh";
        "Mod4+Escape" = "exec ~/.config/eww/scripts/toggle_widget.sh power, mode \"power_menu\"";
        "Mod4+Shift+v" =
          "exec rofi -modi \"clipboard:greenclip print\" -show clipboard -run-command '{cmd}'";

        "Mod4+s" = "layout stacking";
        "Mod4+g" = "layout tabbed";
        "Mod4+d" = "layout toggle split";
        "Mod4+b" = "split h";
        "Mod4+v" = "split v";

        "Mod4+minus" = "scratchpad show";
        "Mod4+Shift+minus" = "move scratchpad";

        "Mod4+h" = "focus left";
        "Mod4+j" = "focus down";
        "Mod4+k" = "focus up";
        "Mod4+l" = "focus right";

        "Mod4+Shift+h" = "move left";
        "Mod4+Shift+j" = "move down";
        "Mod4+Shift+k" = "move up";
        "Mod4+Shift+l" = "move right";

        "Mod4+Shift+p" = "exec playerctl play-pause";
        "Mod4+Shift+n" = "exec playerctl next";
        "Mod4+Shift+b" = "exec playerctl previous";
        "Mod4+Shift+m" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "Mod4+Shift+Up" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "Mod4+Shift+Down" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";

        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";

        "Mod4+Shift+d" = "exec dunstify -u low -r 12345 \"Calendar\" \"<tt>$(cal)</tt>\"";
      };
    };
  };
}
