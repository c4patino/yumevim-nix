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

      disableNetrw = true;
      hijackNetrw = true;
      hijackCursor = true;
      hijackUnnamedBufferWhenOpening = true;
      syncRootWithCwd = true;

      updateFocusedFile.enable = true;

      sortBy = "case_sensitive";

      filters = {
        custom = ["__pycache__"];
        exclude = [];
      };

      git = {
        enable = true;
        ignore = true;
      };

      view = {
        side = "right";
        width = 60;
        number = true;
        relativenumber = true;
        preserveWindowProportions = true;
      };

      renderer = {
        rootFolderLabel = false;
        indentWidth = 2;
        highlightGit = true;
        indentMarkers.enable = true;

        groupEmpty = true;

        icons.glyphs = {
          default = "󰈚";
          symlink = "";
          folder = {
            default = "";
            empty = "";
            emptyOpen = "";
            open = "";
            symlink = "";
            symlinkOpen = "";
            arrowOpen = "";
            arrowClosed = "";
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
    };
  };
}
