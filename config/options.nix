{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    nu = true;
    relativenumber = true;

    tabstop = 4;
    shiftwidth = 4;
    expandtab = true;

    wrap = false;

    swapfile = false;
    backup = false;
    undofile = true;

    hlsearch = false;
    incsearch = true;

    termguicolors = true;

    scrolloff = 8;

    foldcolumn = "0";
    foldlevel = 99;
    foldmethod = "expr";
    foldexpr = "nvim_treesitter#foldexpr()";
    foldenable = true;

    signcolumn = "yes";
  };
}
