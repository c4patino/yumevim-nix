{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "buffer";}
          {name = "path";}
        ];

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-y>" = "cmp.mapping.confirm { select = true }";
          "<C-Space>" = "cmp.mapping.complete {}";
        };

        performance = {
          debounce = 60;
          fetching_timeout = 200;
          max_view_entries = 30;
        };

        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
          };

          documentation = {
            border = "rounded";
          };
        };

        formatting = {
          fields = ["kind" "abbr" "menu"];
          expandable_indicator = true;
        };
      };
    };
  };

  extraConfigLua = ''
    kind_icons = {
        Text = "󰊄",
        Method = "",
        Function = "󰡱",
        Constructor = "",
        Field = "",
        Variable = "󱀍",
        Class = "",
        Interface = "",
        Module = "󰕳",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    }

    local cmp = require'cmp'

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({'/', "?" }, {
        sources = {
            { name = 'buffer' }
        }
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'cmp_git' },
        }, {
            { name = 'buffer' },
        })
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        }),
    })
  '';
}
