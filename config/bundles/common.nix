{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace enabled;
  base = "${namespace}.bundles.common";
  cfg = getAttrByNamespace config base;
in {
  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "common bundle";
  };

  config = mkIf cfg.enable {
    ${namespace} = {
      languages = {
        cmp = enabled;
        conform = enabled;
        dap = enabled;
        luasnip = enabled;
        treesitter = enabled;
      };

      navigation = {
        harpoon = enabled;
        nvim-tree = enabled;
        telescope = enabled;
      };

      ui = {
        alpha = enabled;
        fidget = enabled;
        indent-blankline = enabled;
        lualine = enabled;
        noice = enabled;
        nvim-notify = enabled;
      };

      utils = {
        lazygit = enabled;
        todo-comments = enabled;
        toggleterm = enabled;
        undotree = enabled;
        which-key = enabled;
        zenmode = enabled;
      };
    };
  };
}
