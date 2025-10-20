{
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    local nix_snippets = {
      -- Module snippet
      s("module", {
        t({
          "{",
          "  config,",
          "  lib,",
          "  namespace,",
          "  pkgs,",
          "  ...",
          "}: let",
          "  inherit (lib) mkIf mkEnableOption;",
          "  ${"inherit (lib.\${namespace}) getAttrByNamespace mkOptionsWithNamespace;"}",
          "  base = \""
        }),
        t("${"\${namespace}"}"),
        i(1, "namespace"),
        t("."),
        i(2, "category"),
        t("."),
        i(3, "module"),
        t({"\";",
          "  cfg = getAttrByNamespace config base;",
          "in {",
          "  options = mkOptionsWithNamespace base {",
          "    enable = mkEnableOption \""
        }),
        i(4, "description"),
        t({"\";",
          "  };",
          "",
          "  config = mkIf cfg.enable {",
          "    "
        }),
        i(5, "# configuration"),
        t({
          "",
          "  };",
          "}",
        }),
      }),

      -- Bundle snippet
      s("bundle", {
        t({
          "{",
          "  config,",
          "  lib,",
          "  namespace,",
          "  ...",
          "}: let",
          "  inherit (lib) mkIf mkEnableOption;",
          "  ${"inherit (lib.\${namespace}) getAttrByNamespace mkOptionsWithNamespace enabled;"}",
          "  base = \""
        }),
        t("${"\${namespace}"}"),
        t(".bundles."),
        i(2, "name"),
        t({"\";",
          "  cfg = getAttrByNamespace config base;",
          "in {",
          "  options = mkOptionsWithNamespace base {",
          "    enable = mkEnableOption \""
        }),
        i(3, "name"),
        t({" bundle\";",
          "  };",
          "",
          "  config = mkIf cfg.enable {",
          "    "
        }),
        i(4, "# enabled modules"),
        t({
          "",
          "  };",
          "}",
        }),
      }),

      -- Enable a module
      s("enable", {
        i(1, "module.path"),
        t({" = {",
           "  enable = true;",
           "  "
        }),
        i(2, "# configuration"),
        t({
          "",
          "};",
        }),
      }),

      -- Enable with 'enabled'
      s("enabled", {
        i(1, "module.path"),
        t({" = enabled;"})
      }),

      -- Home attribute setup
      s("home", {
        t({
          "home = {",
          "  packages = with pkgs; ["
        }),
        i(1, "# packages"),
        t({
          " ];",
          "  "
        }),
        i(2, "# other home attributes"),
        t({
          "",
          "};",
        }),
      }),
    }

    ls.add_snippets("nix", nix_snippets)
  '';
}
