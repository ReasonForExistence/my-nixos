{ config, ... }:

{
  # Link the Neovim configuration folder to ~/.config/nvim out of the nix store
  # so that LazyVim can dynamically write to lazy-lock.json and you can freely edit files.
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.my-nixos/modules/home/nvim";
}
