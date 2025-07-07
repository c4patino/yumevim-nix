{
  autoCmd = [
    {
      event = "TextYankPost";
      callback.__raw = ''
        function()
          vim.highlight.on_yank({ higroup = "IncSearch", timeout = 50, });
        end
      '';
    }
    {
      event = "FileType";
      pattern = ["astro" "javascript" "javascriptreact" "nix" "tex" "typescript" "typescriptreact"];
      callback.__raw = ''
        function()
          vim.opt_local.tabstop = 2;
          vim.opt_local.shiftwidth = 2;
          vim.opt_local.expandtab = true;
        end
      '';
    }
    {
      event = "FileType";
      pattern = "tex";
      callback.__raw = ''
        function()
          vim.opt_local.wrap = true;
          vim.opt_local.textwidth = 80;
          vim.opt_local.linebreak = true;
          vim.keymap.set("n", "<leader>zz", function()
            if require("zen-mode.view").is_open() then
              require("zen-mode").toggle()
            else
              require("zen-mode").toggle({ window = { width = 85 } })
            end
          end, { buffer = true, desc = "ZenMode toggle" })
        end
      '';
    }
  ];
}
