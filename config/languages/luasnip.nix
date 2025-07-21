{
  plugins.luasnip = {
    enable = true;
    
    # Basic LuaSnip settings
    settings = {
      history = true;
      updateevents = "TextChanged,TextChangedI";
      enable_autosnippets = true;
    };
  };

  # Add keymaps for snippet navigation
  keymaps = [
    {
      mode = "i";
      key = "<C-k>";
      action = "<cmd>lua require('luasnip').expand_or_jump()<CR>";
      options.desc = "Snippets Expand or jump forward";
    }
    {
      mode = "i";
      key = "<C-j>";
      action = "<cmd>lua require('luasnip').jump(-1)<CR>";
      options.desc = "Snippets Jump backward";
    }
    {
      mode = "i";
      key = "<C-l>";
      action = "<cmd>lua require('luasnip').change_choice(1)<CR>";
      options.desc = "Snippets Cycle choices";
    }
  ];

  # Core snippet configuration and definitions
  extraConfigLua = ''
    local ls = require("luasnip")
    local types = require("luasnip.util.types")
    
    -- Add visual indicators for snippet nodes
    ls.config.set_config({
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = {{"●", "GruvboxOrange"}}
          }
        },
        [types.insertNode] = {
          active = {
            virt_text = {{"●", "GruvboxBlue"}}
          }
        }
      }
    })
    
    -- Common snippet creation utilities
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local fmt = require("luasnip.extras.fmt").fmt
    local rep = require("luasnip.extras").rep
    local parse = require("luasnip.util.parser").parse_snippet

    -- Function to generate namespace interpolation at runtime
    local function namespace_interp(suffix)
      -- Uses string.char to generate the namespace interpolation
      return string.char(36) .. string.char(123) .. "namespace" .. string.char(125) .. suffix
    end

    -- Nix snippets
    local nix_snippets = {
      -- Module snippet
      module = s("module", {
        -- Opening
        t({
          "{",
          "  config,",
          "  lib,",
          "  namespace,",
          "  pkgs,",
          "  ...",
          "}: let",
          "  inherit (lib) mkIf mkEnableOption;",
          "  inherit (lib."
        }),
        f(function() return namespace_interp("") end),
        t(") getAttrByNamespace mkOptionsWithNamespace;"),
        t({"", "  base = \""}),
        f(function() return namespace_interp(".") end),
        i(1, "category"),
        t("."),
        i(2, "module"),
        t({
          "\";",
          "  cfg = getAttrByNamespace config base;",
          "in {",
          "  options = mkOptionsWithNamespace base {",
          "    enable = mkEnableOption \""
        }),
        i(3, "description"),
        t({
          "\";",
          "  };",
          "",
          "  config = mkIf cfg.enable {",
          "    "
        }),
        i(4, "# configuration"),
        t({"", "  };", "}"}),
      }),

      -- Bundle module
      bundle = s("bundle", {
        t({
          "{",
          "  config,",
          "  lib,",
          "  namespace,",
          "  ...",
          "}: let",
          "  inherit (lib) mkIf mkEnableOption;",
          "  inherit (lib."
        }),
        f(function() return namespace_interp("") end),
        t(") getAttrByNamespace mkOptionsWithNamespace enabled;"),
        t({"", "  base = \""}),
        f(function() return namespace_interp(".bundles.") end),
        i(1, "name"),
        t({
          "\";",
          "  cfg = getAttrByNamespace config base;",
          "in {",
          "  options = mkOptionsWithNamespace base {",
          "    enable = mkEnableOption \""
        }),
        i(2, "name"),
        t({
          " bundle\";",
          "  };",
          "",
          "  config = mkIf cfg.enable {",
          "    "
        }),
        f(function() return namespace_interp("") end),
        t(" = {"),
        t({"", "      "}),
        i(3, "# enabled modules"),
        t({"", "    };", "  };", "}"})
      }),
      
      -- Simple patterns using formatted strings
      enable = s("enable", fmt([[
{} = {{
  enable = true;
  {}
}};]], {
        i(1, "module.path"),
        i(2, "# configuration"),
      })),
      
      enabled = s("enabled", fmt("{} = enabled;", {
        i(1, "module.path"),
      })),
      
      home = s("home", fmt([[
home = {{
  packages = with pkgs; [ {} ];
  {}
}};]], {
        i(1, "# packages"),
        i(2, "# other home attributes"),
      })),
    }

    -- Add snippets to filetypes
    ls.add_snippets("nix", nix_snippets)
  '';
}