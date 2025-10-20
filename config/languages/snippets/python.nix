{
  # Python-specific snippets
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local fmt = require("luasnip.extras.fmt").fmt

    local python_snippets = {
      -- Import statement
      s("imp", {
        t("import "),
        i(1, "module")
      }),

      -- From import statement
      s("fimp", fmt("from {} import {}", {
        i(1, "module"),
        i(2, "name")
      })),

      -- Class definition
      s("class", fmt([[
        class {}:
            """{}"""

            def __init__(self{}):
                {}
      ]], {
        i(1, "ClassName"),
        i(2, "Class docstring"),
        i(3, ""),
        i(4, "# Implementation"),
      })),

      -- Function definition
      s("def", fmt([[
        def {}({}):
            """{}

            {}
            {}
            """
            {}
      ]], {
        i(1, "function_name"),
        i(2, ""),
        i(3, "Function docstring"),
        c(4, {
          t("Args:"),
          t("Parameters:"),
        }),
        i(5, "    arg: Description"),
        i(6, "    # Implementation"),
      })),

      -- Main function
      s("main", fmt([[
        def main():
            {}

        if __name__ == "__main__":
            main()
      ]], {
        i(1, "# Implementation"),
      })),

      -- Try/except block
      s("try", fmt([[
        try:
            {}
        except {}:
            {}
      ]], {
        i(1, "# Try block"),
        i(2, "Exception"),
        i(3, "# Exception handling"),
      })),

      -- Context manager (with statement)
      s("with", fmt([[
        with {} as {}:
            {}
      ]], {
        i(1, "context_manager"),
        i(2, "variable"),
        i(3, "# Implementation"),
      })),

      -- List comprehension
      s("lc", fmt("[{} for {} in {}]", {
        i(1, "expression"),
        i(2, "item"),
        i(3, "iterable"),
      })),

      -- Dictionary comprehension
      s("dc", fmt("{{{}: {} for {} in {}}}", {
        i(1, "key"),
        i(2, "value"),
        i(3, "item"),
        i(4, "iterable"),
      })),

      -- Test function (pytest)
      s("test", fmt([[
        def test_{}():
            """{}"""
            {}
      ]], {
        i(1, "name"),
        i(2, "Test docstring"),
        i(3, "# Test implementation"),
      }))
    }

    -- Add these snippets to Python files
    ls.add_snippets("python", python_snippets)
  '';
}
