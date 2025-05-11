{
  keymaps = [
    {
      mode = "n";
      key = "<leader>pws";
      action.__raw = ''
        function()
            local word = vim.fn.expand("<cword>")
            require('telescope.builtin').grep_string({ search = word })
        end
      '';
      options.desc = "Telescope Live grep word under cursor";
    }
    {
      mode = "n";
      key = "<leader>pWs";
      action.__raw = ''
        function()
            local word = vim.fn.expand("cWORD")
            require('telescope.builtin').grep_string({ search = word })
        end
      '';
      options.desc = "Telecope Live grep WORD under cursor";
    }
  ];

  plugins.telescope = {
    keymaps = {
      "<leader>pf" = {
        action = "find_files";
        options.desc = "Telescope Find project files";
      };
      "<leader>pa" = {
        action = "find_files follow=true no_ignore=true hidden=true";
        options.desc = "Telescope Find all files";
      };
      "<leader>pz" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Telescope Find in buffer";
      };
      "<leader>ps" = {
        action = "live_grep";
        options.desc = "Telescope Live grep";
      };

      "ws" = {
        action = "lsp_document_symbols ignore_symbols='variable'";
        options.desc = "Telescope LSP Document symbols";
      };

      "<leader>tt" = {
        action = "diagnostics";
        options.desc = "Telescope Diagnostics";
      };
      "<leader>tf" = {
        action = "diagnostics bufnr=0";
        options.desc = "Telescope Diagnostics in buffer";
      };

      "<leader>:" = {
        action = "command_history";
        options.desc = "Telescope Command history";
      };
    };

    enable = true;

    extensions = {
      fzf-native.enable = true;
      ui-select.settings.specific_opts.codeactions = true;
      undo.enable = true;
    };

    settings = {
      defaults = {
        prompt_prefix = "   ";
        selection_caret = " ";
        entry_prefix = " ";

        sorting_strategy = "ascending";
        layout_config = {
          horizontal = {
            prompt_position = "top";
            preview_width = 0.65;
          };

          width = 0.75;
          height = 0.80;
        };
      };
    };
  };
}
