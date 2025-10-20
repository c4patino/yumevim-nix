{...} @ inputs: {
  imports = [
    (import ./lazygit.nix inputs)
    (import ./obsidian.nix inputs)
    (import ./todo-comments.nix inputs)
    (import ./toggleterm.nix inputs)
    (import ./undotree.nix inputs)
    (import ./vimtex.nix inputs)
    (import ./which-key.nix inputs)
    (import ./zenmode.nix inputs)
  ];
}
