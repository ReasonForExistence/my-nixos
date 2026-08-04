{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    themeFile = "Catppuccin-Mocha";
    settings = {
      window_padding_width = 16;
      background_opacity = "0.85";

      cursor_shape = "block";
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = "15.0";

      enable_audio_bell = false;
    };
  };
}
