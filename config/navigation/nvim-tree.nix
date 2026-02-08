{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace;
  base = "${namespace}.navigation.nvim-tree";
  cfg = getAttrByNamespace config base;
in {
  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "nvim-tree";
  };

  config = mkIf cfg.enable {
    keymaps = [
      {
        mode = "n";
        key = "<leader>pv";
        action = "<cmd>NvimTreeToggle<cr>";
        options.desc = "Toggle NvimTree";
      }
    ];

    plugins.web-devicons.enable = true;

    plugins.nvim-tree = {
      enable = true;

      settings = {
        disable_netrw = true;
        hijack_cursor = true;
        hijack_netrw = true;
        hijack_unnamed_buffer_when_opening = true;
        sync_root_with_cwd = true;

        sort_by = "case_sensitive";

        filters = {
          custom = ["__pycache__"];
          exclude = [];
        };

        git = {
          enable = true;
          ignore = true;
        };

        renderer = {
          root_folder_label = false;
          indent_width = 2;
          highlight_git = true;
          indent_markers.enable = true;

          group_empty = true;

          icons.glyphs = {
            default = "󰈚";
            symlink = "";
            folder = {
              default = "";
              empty = "";
              empty_open = "";
              open = "";
              symlink = "";
              symlink_open = "";
              arrow_open = "";
              arrow_closed = "";
            };
            git = {
              unstaged = "✗";
              staged = "✓";
              unmerged = "";
              renamed = "➜";
              untracked = "★";
              deleted = "";
              ignored = "◌";
            };
          };
        };

        view = {
          side = "right";
          width = 60;
          number = true;
          relativenumber = true;
          preserve_window_proportions = true;
        };
      };
    };
  };
}
