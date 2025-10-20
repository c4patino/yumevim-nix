{
  config,
  lib,
  namespace,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  inherit (lib.${namespace}) getAttrByNamespace mkOptionsWithNamespace;
  base = "${namespace}.utils.undotree";
  cfg = getAttrByNamespace config base;
in {
  options = mkOptionsWithNamespace base {
    enable = mkEnableOption "undotree";
  };

  config = mkIf cfg.enable {
    keymaps = [
      {
        mode = "n";
        key = "<leader>u";
        action = "<cmd>UndotreeToggle<cr>";
        options.desc = "Undotree Toggle window";
      }
    ];

    plugins.undotree = {
      enable = true;

      settings = {
        WindowLayout = 4;
        DiffpaneHeight = 15;
        SplitWidth = 40;
      };
    };
  };
}
