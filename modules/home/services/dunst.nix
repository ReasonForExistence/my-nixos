{ config, pkgs, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 340;
        height = 140;
        offset = "24x24";
        origin = "top-right";
        transparency = 10;
        frame_color = "#cba6f7";
        background = "#1e1e2ee6";
        foreground = "#cdd6f4";
        font = "JetBrainsMono Nerd Font 11";
        corner_radius = 16;
        padding = 20;
        horizontal_padding = 24;
        icon_position = "left";
        max_icon_size = 64;
        frame_width = 0;
        gap_size = 8;
        separator_color = "auto";
        sort = "yes";
        idle_threshold = 120;
        line_height = 0;
        markup = "full";
        plain_text = "no";
        format = "<b>%s</b>\n%b";
      };
    };
  };
}
