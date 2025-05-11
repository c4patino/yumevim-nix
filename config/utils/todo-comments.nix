{
  keymaps = [
    {
      mode = "n";
      key = "<leader>tc";
      action = "<cmd>TodoTelescope<cr>";
      options.desc = "Telescope Find todo comments";
    }
  ];

  plugins = {
    todo-comments.enable = true;
  };
}
