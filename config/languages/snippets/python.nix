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
      -- ===============================================================================
      --   LANGUAGE: Core Python Language Features
      -- ===============================================================================

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

      -- Main function
      s("main", fmt([[
        def main():
            {}

        if __name__ == "__main__":
            main()
      ]], {
        i(1),
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
        i(3),
      })),

      -- Context manager (with statement)
      s("with", fmt([[
        with {} as {}:
            {}
      ]], {
        i(1, "context_manager"),
        i(2, "variable"),
        i(3),
      })),

      -- Guard clause
      s("guard", fmt([[
        if not {}:
            raise {}
      ]], {
        i(1, "condition"),
        i(2, "ValueError"),
      })),

      -- Assert statement
      s("assert", fmt("assert {}, {}", {
        i(1, "condition"),
        i(2, '"Assertion message"'),
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

      -- For loop
      s("for", fmt([[
        for {} in {}:
            {}
      ]], {
        i(1, "item"),
        i(2, "iterable"),
        i(3),
      })),

      -- While loop
      s("while", fmt([[
        while {}:
            {}
      ]], {
        i(1, "condition"),
        i(2),
      })),

      -- Enumerate loop
      s("enum", fmt([[
      for {}, {} in enumerate({}, start={}):
          {}
      ]], {
        i(1, "index"),
        i(2, "item"),
        i(3, "iterable"),
        i(4, "0"),
        i(5),
      })),

      -- Dictionary iteration
      s("items", fmt([[
      for {}, {} in {}.items():
          {}
      ]], {
        i(1, "key"),
        i(2, "value"),
        i(3, "dictionary"),
        i(4),
      })),

      -- Zip loop
      s("zip", fmt([[
      for {}, {} in zip({}, {}):
          {}
      ]], {
        i(1, "a"),
        i(2, "b"),
        i(3, "list_a"),
        i(4, "list_b"),
        i(5),
      })),

      -- ===============================================================================
      --   TYPES: Type Definitions
      -- ===============================================================================

      -- Class
      s("class", fmt([[
        class {}({}):
            """{}"""

            def __init__(self{} {}) -> None:
                {}
      ]], {
        i(1, "ClassName"),
        i(2, "object"),
        i(3, "Class docstring"),
        i(4, ""),
        c(5, {
          t(""),
          t(":"),
        }),
        i(6),
      })),

      -- Function
      s("def", fmt([[
        def {}({}){}:
            """{}
            """
            {}
      ]], {
        i(1, "function_name"),
        i(2, ""),
        i(3, " -> {}"),
        i(4, "Function docstring"),
        i(5),
      })),

      -- ===============================================================================
      --   LIBRARIES: pytest
      -- ===============================================================================

      -- Test function (pytest)
      s("test", fmt([[
        def test_{}():
            """{}"""
            {}
      ]], {
        i(1, "name"),
        i(2, "Test docstring"),
        i(3),
      }))

    }

    -- Add these snippets to Python files
    ls.add_snippets("python", python_snippets)
  '';
}
