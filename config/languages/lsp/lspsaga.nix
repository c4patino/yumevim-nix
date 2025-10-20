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
      beacon = {
        enable = true;
      };
      ui = {
        border = "rounded";
        codeAction = "💡";
      };
      hover = {
        openCmd = "!floorp";
        openLink = "gx";
      };
      diagnostic = {
        borderFollow = true;
        diagnosticOnlyCurrent = false;
        showCodeAction = true;
      };
      symbolInWinbar = {
        enable = true;
      };
      codeAction = {
        extendGitSigns = false;
        showServerName = true;
        onlyInCursor = true;
        numShortcut = true;
        keys = {
          exec = "<cr>";
          quit = ["<Esc>" "q"];
        };
      };
      lightbulb = {
        enable = false;
        sign = false;
        virtualText = true;
      };
      implement.enable = false;
      rename = {
        autoSave = false;
        keys = {
          exec = "<cr>";
          quit = ["<C-k>" "<Esc>"];
          select = "x";
        };
      };
      outline = {
        autoClose = true;
        autoPreview = true;
        closeAfterJump = true;
        layout = "normal";
        winPosition = "right";
        keys = {
          jump = "e";
          quit = "q";
          toggleOrJump = "o";
        };
      };
      scrollPreview = {
        scrollDown = "<C-f>";
        scrollUp = "<C-b>";
      };
    };
  };
}
