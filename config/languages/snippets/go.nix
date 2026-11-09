{
  # Go snippets
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

    local go_snippets = {
      -- ===============================================================================
      --   LANGUAGE: Core Go Language Features
      -- ===============================================================================

      -- Package
      s("package", fmt("package {}", {
        i(1, "main")
      })),

      -- Imports
      s("import", fmt('import "{}"', {
        i(1, "fmt")
      })),

      s("imports", fmt([[
        import (
            "{}"
            "{}"
        )
      ]], {
        i(1, "fmt"),
        i(2, "context")
      })),

      -- Main
      s("main", fmt([[
        func main() {{
            {}
        }}
      ]], {
        i(1)
      })),

      -- Functions
      s("fn", fmt([[
        func {}({}) {} {{
            {}
        }}
      ]], {
        i(1, "functionName"),
        i(2),
        i(3),
        i(4)
      })),

      -- Methods
      s("method", fmt([[
        func ({} *{}) {}({}) {} {{
            {}
        }}
      ]], {
          i(1, "receiver"),
          i(2, "Type"),
        i(3, "Method"),
        i(4),
        i(5),
        i(6)
      })),

      -- Variables
      s("var", fmt("var {} {} = {}", {
        i(1, "name"),
        i(2, "string"),
        i(3, '""')
      })),

      s("short", fmt("{} := {}", {
        i(1, "name"),
        i(2, "value")
      })),

      s("const", fmt("const {} = {}", {
        i(1, "Name"),
        i(2, "value")
      })),

      -- Control flow
      s("if", fmt([[
        if {} {{
            {}
        }}
      ]], {
        i(1, "condition"),
        i(2)
      })),

      s("ife", fmt([[
        if {} {{
            {}
        }} else {{
            {}
        }}
      ]], {
        i(1, "condition"),
        i(2),
        i(3)
      })),

      s("iferr", fmt([[
        if err != nil {{
            {}
        }}
      ]], {
        i(1, "return err")
      })),

      s("for", fmt([[
        for {} := {}; {} < {}; {}++ {{
            {}
        }}
      ]], {
        i(1, "i"),
        i(2, "0"),
        i(3, "i"),
        i(4, "count"),
        i(5, "i"),
        i(6)
      })),

      s("range", fmt([[
        for {}, {} := range {} {{
            {}
        }}
      ]], {
        i(1, "_"),
        i(2, "value"),
        i(3, "items"),
        i(4)
      })),

      s("switch", fmt([[
        switch {} {{
        case {}:
            {}
        default:
            {}
        }}
      ]], {
        i(1, "value"),
        i(2, "caseValue"),
        i(3),
        i(4)
      })),

      -- Collections
      -- Slices
      s("slice", fmt("var {} []{}", {
        i(1, "items"),
        i(2, "string")
      })),

      s("makeSlice", fmt("{} := make([]{}, {}, {})", {
        i(1, "items"),
        i(2, "string"),
        i(3, "0"),
        i(4, "10")
      })),

      s("append", fmt("{} = append({}, {})", {
        i(1, "items"),
        i(2, "items"),
        i(3, "value")
      })),

      -- Maps
      s("map", fmt("map[{}]{}{{}}", {
        i(1, "string"),
        i(2, "int")
      })),

      s("makeMap", fmt("{} := make(map[{}]{})", {
        i(1, "items"),
        i(2, "string"),
        i(3, "int")
      })),

      s("select", fmt([[
        select {{
        case {}:
            {}
        case {}:
            {}
        default:
            {}
        }}
      ]], {
        i(1, "value := <-ch"),
        i(2),
        i(3, "ch <- value"),
        i(4),
        i(5)
      })),

      -- Error handling
      s("err", fmt('return fmt.Errorf("{}: %w", {})', {
        i(1, "operation failed"),
        i(2, "err")
      })),

      s("wraperr", fmt('fmt.Errorf("{}: %w", {})', {
        i(1, "operation failed"),
        i(2, "err")
      })),

      s("panic", fmt('panic("{}")', {
        i(1, "unexpected error")
      })),

      -- Defer and context
      s("defer", fmt("defer {}()", {
        i(1, "cleanup")
      })),

      s("context", fmt([[
        ctx, cancel := context.WithCancel({})
        defer cancel()
      ]], {
        i(1, "context.Background()")
      })),

      -- Generics
      s("generic", fmt([[
        func {}[{} {}]({}) {} {{
            {}
        }}
      ]], {
        i(1, "Function"),
        i(2, "T"),
        i(3, "any"),
        i(4, "value T"),
        i(5, "T"),
        i(6, "return value")
      })),

      -- ===============================================================================
      --   LANGUAGE: Concurrency (Goroutines and Channels)
      -- ===============================================================================

      -- Goroutines
      s("go", fmt([[
        go func() {{
            {}
        }}()
      ]], {
        i(1)
      })),

      s("goroutine", fmt([[
        go func({}) {{
            {}
        }}({})
      ]], {
        i(1, "value string"),
        i(2),
        i(3, "value")
      })),

      -- Channels
      s("channel", fmt("make(chan {})", {
        i(1, "int")
      })),

      s("buffered", fmt("make(chan {}, {})", {
        i(1, "int"),
        i(2, "10")
      })),

      s("close", fmt("close({})", {
        i(1, "ch")
      })),

      -- ===============================================================================
      --   LANGUAGE: Output and Logging
      -- ===============================================================================

      -- Logging
      s("log", fmt('log.Printf("{}: %v", {})', {
        i(1, "message"),
        i(2, "value")
      })),

      s("slog", fmt('slog.Info("{}", "{}")', {
        i(1, "message"),
        i(2, "key")
      })),

      -- Output
      s("print", fmt('fmt.Println("{}")', {
        i(1, "message")
      })),

      s("printf", fmt('fmt.Printf("{}\\n", {})', {
        i(1, "%v"),
        i(2, "value")
      })),

      -- ===============================================================================
      --   TYPES: Type Definitions
      -- ===============================================================================

      -- Structs and interfaces
      s("struct", fmt([[
        type {} struct {{
            {}
        }}
      ]], {
        i(1, "User"),
        i(2, "Name string")
      })),

      s("interface", fmt([[
        type {} interface {{
            {}
        }}
      ]], {
        i(1, "Reader"),
        i(2, "Read([]byte) (int, error)")
      })),

      s("type", fmt("type {} {}", {
        i(1, "Name"),
        i(2, "string")
      })),

      -- ===============================================================================
      --   LIBRARIES: Testing
      -- ===============================================================================

      -- Testing
      s("test", fmt([[
        func Test{}(t *testing.T) {{
            {}
        }}
      ]], {
        i(1, "Function"),
        i(2)
      })),

      s("testassert", fmt([[
        if got := {}; got != {} {{
            t.Errorf("got %v, want %v", got, {})
        }}
      ]], {
        i(1, "actual"),
        i(2, "expected"),
        i(3, "expected")
      })),

      s("benchmark", fmt([[
        func Benchmark{}(b *testing.B) {{
          for b.Loop() {{
              {}
          }}
        }}
      ]], {
        i(1, "Function"),
        i(2)
      })),

      s("tabletest", fmt([[
        func Test{}(t *testing.T) {{
            tests := []struct {{
                name string
                input {}
                want {}
            }}{{
                {{
                    name: "{}",
                    input: {},
                    want: {},
                }},
            }}

            for _, tt := range tests {{
                t.Run(tt.name, func(t *testing.T) {{
                    got := {}
                    if got != tt.want {{
                        t.Errorf("got %v, want %v", got, tt.want)
                    }}
                }})
            }}
        }}
      ]], {
        i(1, "Function"),
        i(2, "string"),
        i(3, "string"),
        i(4, "basic case"),
        i(5, '"input"'),
        i(6, '"expected"'),
        i(7, "Function(tt.input)")
      })),


    }

    ls.add_snippets("go", go_snippets)
  '';
}
