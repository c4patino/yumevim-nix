{
  keymaps = [
    {
      mode = "n";
      key = "<leader>u";
      action = "<cmd>UndotreeToggle<cr>";
      options.desc = "Undotree Toggle window";
    }
  ];

  plugins.undotree = {
    enable = true;

    settings = {
      WindowLayout = 4;
      DiffpaneHeight = 15;
      SplitWidth = 40;
    };
  };
}
