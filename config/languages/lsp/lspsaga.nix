{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf;
  inherit (lib.${namespace}) getAttrByNamespace;
  cfg = getAttrByNamespace config "${namespace}.languages.lsp";
in {
  config = mkIf cfg.enable {
    keymaps = [
      {
        mode = "n";
        key = "gd";
        action = "<cmd>Lspsaga finder def<cr>";
        options = {
          desc = "Goto Definition";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>Lspsaga finder ref<cr>";
        options = {
          desc = "Goto References";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "gI";
        action = "<cmd>Lspsaga finder imp<cr>";
        options = {
          desc = "Goto Implementation";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "gT";
        action = "<cmd>Lspsaga peek_type_definition<cr>";
        options = {
          desc = "Type Definition";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "K";
        action = "<cmd>Lspsaga hover_doc<cr>";
        options = {
          desc = "Hover";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "<leader>cw";
        action = "<cmd>Lspsaga outline<cr>";
        options = {
          desc = "Outline";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "<leader>cr";
        action = "<cmd>Lspsaga rename<cr>";
        options = {
          desc = "Rename";
          silent = true;
        };
      }

      {
        mode = "n";
        key = "<leader>ca";
        action = "<cmd>Lspsaga code_action<cr>";
        options = {
          desc = "Code Action";
          silent = true;
        };
      }
    ];

    plugins.lspsaga = {
      enable = true;
      settings = {
        beacon = {
          enable = true;
        };
        ui = {
          border = "rounded";
          code_action = "💡";
        };
        hover = {
          open_cmd = "!floorp";
          open_link = "gx";
        };
        diagnostic = {
          border_follow = true;
          diagnostic_only_current = false;
          show_code_action = true;
        };
        symbol_in_winbar = {
          enable = true;
        };
        code_action = {
          extend_git_signs = false;
          show_server_name = true;
          only_in_cursor = true;
          num_shortcut = true;
          keys = {
            exec = "<cr>";
            quit = ["<Esc>" "q"];
          };
        };
        lightbulb = {
          enable = false;
          sign = false;
          virtual_text = true;
        };
        implement = {
          enable = false;
        };
        rename = {
          auto_save = false;
          keys = {
            exec = "<cr>";
            quit = ["<C-k>" "<Esc>"];
            select = "x";
          };
        };
        outline = {
          auto_close = true;
          auto_preview = true;
          close_after_jump = true;
          layout = "normal";
          win_position = "right";
          keys = {
            jump = "e";
            quit = "q";
            toggle_or_jump = "o";
          };
        };
        scroll_preview = {
          scroll_down = "<C-f>";
          scroll_up = "<C-b>";
        };
      };
    };
  };
}
