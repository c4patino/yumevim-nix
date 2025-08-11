{
  imports = [
    ./lazygit.nix
    ./obsidian.nix
    ./todo-comments.nix
    ./toggleterm.nix
    ./undotree.nix
    ./vimtex.nix
    ./zenmode.nix
  ];

  plugins = {
    persistence.enable = true;
    which-key.enable = true;
  };
}
