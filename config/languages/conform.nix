{
  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>FormatToggle<cr>";
      options = {
        silent = true;
        desc = "Conform Toggle autoformat";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>f";
      action = "<cmd>lua require('conform').format({ lsp_format = \"fallback\" })<cr>";
      options = {
        silent = true;
        desc = "Conform Format";
      };
    }
  ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = true;

      default_format_opts = {
        lsp_format = "fallback";
      };

      formatters_by_ft = {
        javascript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        javascriptreact = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        typescript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        typescriptreact = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          stop_after_first = true;
        };
        lua = {
          __unkeyed-1 = "stylua";
        };
        nix = {
          __unkeyed-1 = "alejandra";
        };
        racket = {
          __unkeyed-1 = "raco_fmt";
        };
      };

      formatters = {
        raco_fmt = {
          command = "raco";
          args = ["fmt"];
        };
      };
    };
  };

  extraConfigLua = ''
    local conform = require("conform")
    local notify = require("notify")

    conform.setup({
        format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { lsp_format = "fallback" }
        end,
    })

    local function show_notification(message, level)
        notify(message, level, { title = "conform.nvim" })
    end

    vim.api.nvim_create_user_command("FormatToggle", function(args)
        local is_global = not args.bang
        if is_global then
            vim.g.disable_autoformat = not vim.g.disable_autoformat
            if vim.g.disable_autoformat then
                show_notification("Autoformat-on-save disabled globally", "info")
            else
                show_notification("Autoformat-on-save enabled globally", "info")
            end
        else
            vim.b.disable_autoformat = not vim.b.disable_autoformat
            if vim.b.disable_autoformat then
                show_notification("Autoformat-on-save disabled for this buffer", "info")
            else
                show_notification("Autoformat-on-save enabled for this buffer", "info")
            end
        end
    end, { desc = "Toggle autoformat-on-save", bang = true })
  '';
}
