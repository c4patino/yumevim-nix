{
  keymaps = [
    {
      mode = "n";
      key = "<leader>zz";
      action = "<cmd>ZenMode<cr>";
    }
  ];

  plugins.zen-mode = {
    enable = true;
    settings.window.width = 150;
  };
}
