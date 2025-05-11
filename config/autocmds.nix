{
  autoCmd = [
    {
      event = "TextYankPost";
      callback.__raw = ''function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40, }) end'';
    }
    {
      event = ["FileType"];
      pattern = ["nix" "typescript" "javascript" "typescriptreact" "javascriptreact"];
      callback.__raw = ''function() vim.opt_local.tabstop = 2; vim.opt_local.shiftwidth = 2; vim.opt_local.expandtab = true; end'';
    }
  ];
}
