{...} @ inputs: {
  imports = [
    (import ./lsp inputs)

    (import ./cmp.nix inputs)
    (import ./conform.nix inputs)
    (import ./dap.nix inputs)
    (import ./luasnip.nix inputs)
    (import ./treesitter.nix inputs)
  ];

  plugins = {
    nvim-autopairs.enable = true;
    vim-surround.enable = true;
  };
}
