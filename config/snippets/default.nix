{
  # Import all snippet files here
  imports = [
    ./utils.nix
    ./languages/common.nix
    ./languages/rust.nix
    ./languages/python.nix
    ./languages/nix.nix
  ];

  # This extra config will load all our snippets
  extraConfigLua = ''
    -- Ensure LuaSnip loads all snippet definitions
    require("luasnip.loaders.from_lua").lazy_load()

    -- This function lets us load snippets defined in Nix string
    function load_nix_snippets(snippets, filetypes)
      local ls = require("luasnip")

      for _, ft in ipairs(filetypes) do
        ls.add_snippets(ft, snippets)
      end
    end
  '';
}
