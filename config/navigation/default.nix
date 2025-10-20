{...} @ inputs: {
  imports = [
    (import ./harpoon.nix inputs)
    (import ./nvim-tree.nix inputs)
    (import ./telescope.nix inputs)
  ];
}
