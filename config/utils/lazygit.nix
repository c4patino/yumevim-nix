{
  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<cr>";
      options.desc = "LazyGit Toggle window";
    }
  ];

  plugins = {
    lazygit.enable = true;
  };
}
