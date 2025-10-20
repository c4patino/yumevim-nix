{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace;
  base = "${namespace}.ui.alpha";
  cfg = getAttrByNamespace config base;
in {
  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "alpha";
  };

  config = mkIf cfg.enable {
    plugins = {
      persistence.enable = true;

      alpha = {
        enable = true;
        theme = null;
        layout = let
          mkPadding = val: {
            type = "padding";
            inherit val;
          };
          mkButton = label: shortcut: command: {
            type = "button";
            val = label;
            on_press.__raw = ''
              function()
                local key = vim.api.nvim_replace_termcodes("${shortcut}", true, false, true)
                vim.api.nvim_feedkeys(key, "n", false)
              end
            '';
            opts = {
              keymap = [
                "n"
                shortcut
                command
                {
                  noremap = true;
                  silent = true;
                  nowait = true;
                }
              ];
              shortcut = shortcut;
              position = "center";
              cursor = 3;
              width = 38;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          };
        in [
          (mkPadding 4)
          {
            opts = {
              hl = "AlphaHeader";
              position = "center";
            };
            type = "text";
            val = [
              "▓██   ██▓ █    ██  ███▄ ▄███▓▓█████ ██▒   █▓ ██▓ ███▄ ▄███▓"
              " ▒██  ██▒ ██  ▓██▒▓██▒▀█▀ ██▒▓█   ▀▓██░   █▒▓██▒▓██▒▀█▀ ██▒"
              "  ▒██ ██░▓██  ▒██░▓██    ▓██░▒███   ▓██  █▒░▒██▒▓██    ▓██░"
              "  ░ ▐██▓░▓▓█  ░██░▒██    ▒██ ▒▓█  ▄  ▒██ █░░░██░▒██    ▒██ "
              "  ░ ██▒▓░▒▒█████▓ ▒██▒   ░██▒░▒████▒  ▒▀█░  ░██░▒██▒   ░██▒"
              "   ██▒▒▒ ░▒▓▒ ▒ ▒ ░ ▒░   ░  ░░░ ▒░ ░  ░ ▐░  ░▓  ░ ▒░   ░  ░"
              " ▓██ ░▒░ ░░▒░ ░ ░ ░  ░      ░ ░ ░  ░  ░ ░░   ▒ ░░  ░      ░"
              " ▒ ▒ ░░   ░░░ ░ ░ ░      ░      ░       ░░   ▒ ░░      ░   "
              " ░ ░        ░            ░      ░  ░     ░   ░         ░   "
              "                                                           "
              "                  git@github.com:c4patino                  "
            ];
          }
          (mkPadding 2)
          (mkButton "  Find File" "f" "<CMD>Telescope find_files<CR>")
          (mkPadding 1)
          (mkButton "  New File" "n" "<CMD>ene <BAR> startinsert<CR>")
          (mkPadding 1)
          (mkButton "󰈚  Recent Files" "r" "<CMD>Telescope oldfiles<CR>")
          (mkPadding 1)
          (mkButton "󰈭  Find Word" "g" "<CMD>Telescope live_grep<CR>")
          (mkPadding 1)
          (mkButton "  Restore Session" "s" "<CMD>lua require('persistence').load()<CR>")
          (mkPadding 1)
          (mkButton "  Quit Neovim" "q" "<CMD>qa<CR>")
        ];
      };
    };
  };
}
