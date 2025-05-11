{
  keymaps = [
    {
      mode = "n";
      key = ";";
      action = ":";
      options.desc = "General Enter command mode";
    }
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>noh<cr>";
      options.desc = "General Clear highlights";
    }
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<CR>";
      options.desc = "General File save";
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options.desc = "Vertical Scroll up";
    }
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options.desc = "Vertical Scroll down";
    }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options.desc = "Find/Replace Move to next match";
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options.desc = "Find/Replace Move to previous match";
    }
    {
      mode = "n";
      key = "<leader>s";
      action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
      options.desc = "Find/Replace Replace current word";
    }

    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = {
        silent = true;
        desc = "Editing Move line down";
      };
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = {
        silent = true;
        desc = "Editing Move line up";
      };
    }

    {
      mode = ["n" "v"];
      key = "<leader>y";
      action = "\"+y";
      options.desc = "Editing copy to system clipboard";
    }
    {
      mode = "v";
      key = "<leader>Y";
      action = "\"+Y";
      options.desc = "Editing Copy line to system clipboard";
    }

    {
      mode = "v";
      key = "<leader>p";
      action = "\"_dP";
      options.desc = "Editing Replace text with paste buffer";
    }
    {
      mode = ["n" "v"];
      key = "<leader>d";
      action = "\"_d";
      options.desc = "";
    }
  ];
}
