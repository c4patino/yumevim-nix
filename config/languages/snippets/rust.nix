{
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local c = ls.choice_node
    local fmt = require("luasnip.extras.fmt").fmt

    local rust_snippets = {
      -- ===============================================================================
      --   LANGUAGE: Core Rust Language Features
      -- ===============================================================================

      -- Function
      s("fn", fmt([[
        fn {}({}){} {{
            {}
        }}
      ]], {
        i(1, "function_name"),
        i(2, ""),
        i(3, ""),
        i(4),
      })),

      -- Public function
      s("pfn", fmt([[
        pub fn {}({}){} {{
            {}
        }}
      ]], {
        i(1, "function_name"),
        i(2, ""),
        i(3, ""),
        i(4),
      })),

      -- Main function
      s("main", fmt([[
        fn main() {{
            {}
        }}
      ]], {
        i(1),
      })),

      -- If statement
      s("if", fmt([[
        if {} {{
            {}
        }}
      ]], {
        i(1, "condition"),
        i(2),
      })),

      -- If let
      s("iflet", fmt([[
        if let {} = {} {{
            {}
        }}
      ]], {
        i(1, "Some(value)"),
        i(2, "option"),
        i(3),
      })),

      -- Match expression
      s("match", fmt([[
        match {} {{
            {} => {{}},
            _ => {{}},
        }}
      ]], {
        i(1, "value"),
        i(2, "Some(value)"),
      })),

      -- For loop
      s("for", fmt([[
        for {} in {} {{
            {}
        }}
      ]], {
        i(1, "item"),
        i(2, "items"),
        i(3),
      })),

      -- While loop
      s("while", fmt([[
        while {} {{
            {}
        }}
      ]], {
        i(1, "condition"),
        i(2),
      })),

      -- Loop
      s("loop", fmt([[
        loop {{
            {}
        }}
      ]], {
        i(1),
      })),

      -- Enumerate
      s("enumloop", fmt([[
        for ({}, {}) in {}.iter().enumerate() {{
            {}
        }}
      ]], {
        i(1, "index"),
        i(2, "item"),
        i(3, "items"),
        i(4),
      })),

      -- Result handling
      s("result", fmt([[
        match {} {{
            Ok(value) => {},
            Err(error) => {},
        }}
      ]], {
        i(1, "result"),
        i(2, "value"),
        i(3, "return Err(error)"),
      })),

      -- Option handling
      s("option", fmt([[
        match {} {{
            Some(value) => {},
            None => {},
        }}
      ]], {
        i(1, "option"),
        i(2, "value"),
        i(3, "return None"),
      })),

      -- Propagation operator
      s("prop", fmt("let {} = {}?;", {
        i(1, "value"),
        i(2, "expression"),
      })),

      -- Closure
      s("closure", fmt("|{}| {}", {
        i(1, "value"),
        i(2, "expression"),
      })),

      -- Print
      s("print", fmt('println!("{}", {});', {
        i(1, "{:?}"),
        i(2, "value"),
      })),

      -- Debug print
      s("dbg", fmt('dbg!({});', {
        i(1, "value"),
      })),

      -- TODO
      s("todo", fmt("todo!('{}');", {
        i(1, "Not implemented"),
      })),

      -- Unimplemented
      s("unimpl", fmt("unimplemented!('{}');", {
        i(1, "Not implemented"),
      })),

      -- Module
      s("mod", fmt([[
        pub mod {} {{
            {}
        }}
      ]], {
        i(1, "module_name"),
        i(2),
      })),

      -- ===============================================================================
      --   LANGUAGE: Collections
      -- ===============================================================================

      -- Vector
      s("vec", fmt("let mut {}: Vec<{}> = Vec::new();", {
        i(1, "items"),
        i(2, "String"),
      })),

      -- HashMap
      s("hashmap", fmt([[
        use std::collections::HashMap;

        let mut {}: HashMap<{}, {}> = HashMap::new();
      ]], {
        i(1, "map"),
        i(2, "String"),
        i(3, "i32"),
      })),

      -- HashSet
      s("hashset", fmt([[
        use std::collections::HashSet;

        let mut {}: HashSet<{}> = HashSet::new();
      ]], {
        i(1, "set"),
        i(2, "String"),
      })),

      -- Iterator map
      s("itermap", fmt([[
        {}.iter()
            .map(|{}| {})
            .collect::<{}>()
      ]], {
        i(1, "items"),
        i(2, "item"),
        i(3, "item"),
        i(4, "Vec<_>"),
      })),

      -- Iterator filter
      s("iterfilter", fmt([[
        {}.iter()
            .filter(|{}| {})
            .collect::<{}>()
      ]], {
        i(1, "items"),
        i(2, "item"),
        i(3, "condition"),
        i(4, "Vec<_>"),
      })),

      -- Iterator chain
      s("iterchain", fmt([[
        {}.iter()
            .{}
            .collect::<{}>()
      ]], {
        i(1, "items"),
        i(2, "map(|item| item)"),
        i(3, "Vec<_>"),
      })),

      -- Result propagation function
      s("resfn", fmt([[
        fn {}({}) -> Result<{}, {}> {{
            {}
            Ok({})
        }}
      ]], {
        i(1, "function_name"),
        i(2, ""),
        i(3, "T"),
        i(4, "Box<dyn std::error::Error>"),
        i(5),
        i(6, "value"),
      })),

      -- ===============================================================================
      --   TYPES: Type Definitions
      -- ===============================================================================

      -- Struct
      s("struct", fmt([[
        #[derive(Debug, Clone)]
        pub struct {} {{
            {}
        }}
      ]], {
        i(1, "StructName"),
        i(2, "field: String,"),
      })),

      -- Tuple struct
      s("tuple", fmt([[
        #[derive(Debug, Clone)]
        pub struct {}({});
      ]], {
        i(1, "StructName"),
        i(2, "String"),
      })),

      -- Enum
      s("enum", fmt([[
        #[derive(Debug, Clone, PartialEq)]
        pub enum {} {{
            {}
        }}
      ]], {
        i(1, "EnumName"),
        i(2, "Variant,"),
      })),

      -- Implementation block
      s("impl", fmt([[
        impl {} {{
            {}
        }}
      ]], {
        i(1, "Type"),
        i(2, "// Methods"),
      })),

      -- Trait
      s("trait", fmt([[
        pub trait {} {{
            {}
        }}
      ]], {
        i(1, "TraitName"),
        i(2, "fn method(&self);"),
      })),

      -- Trait implementation
      s("impltrait", fmt([[
        impl {} for {} {{
            {}
        }}
      ]], {
        i(1, "Trait"),
        i(2, "Type"),
        i(3, "// Trait methods"),
      })),

      -- Generic function
      s("genfn", fmt([[
        fn {}<{}>({}) -> {} {{
            {}
        }}
      ]], {
        i(1, "function_name"),
        i(2, "T"),
        i(3, "value: T"),
        i(4, "T"),
        i(5, "value"),
      })),

      -- Generic with trait bound
      s("bound", fmt([[
        fn {}<T: {}>({}) -> {} {{
            {}
        }}
      ]], {
        i(1, "function_name"),
        i(2, "Clone"),
        i(3, "value: T"),
        i(4, "T"),
        i(5, "value"),
      })),

      -- Lifetime function
      s("lifetime", fmt([[
        fn {}<'a>({}: &'a {}) -> &'a {} {{
            {}
        }}
      ]], {
        i(1, "function_name"),
        i(2, "value"),
        i(3, "str"),
        i(4, "str"),
        i(5, "value"),
      })),

      -- Derive
      s("derive", fmt("#[derive({})]", {
        i(1, "Debug, Clone, PartialEq"),
      })),

      -- Custom error
      s("error", fmt([[
        #[derive(Debug)]
        pub enum {} {{
            {}
        }}

        impl std::fmt::Display for {} {{
            fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {{
                write!(f, "{{:?}}", self)
            }}
        }}

        impl std::error::Error for {} {{}}
      ]], {
        i(1, "AppError"),
        i(2, "NotFound"),
        i(3, "AppError"),
        i(4, "AppError"),
      })),

      -- Async function
      s("async", fmt([[
        async fn {}({}) -> {} {{
            {}
        }}
      ]], {
        i(1, "function_name"),
        i(2, ""),
        i(3, "()"),
        i(4),
      })),

      -- ===============================================================================
      --   LIBRARIES: Testing
      -- ===============================================================================

      -- Unit test
      s("test", fmt([[
        #[test]
        fn test_{}() {{
            {}
        }}
      ]], {
        i(1, "name"),
        i(2, "assert_eq!(1 + 1, 2);"),
      })),

      -- Tokio test
      s("testtokio", fmt([[
        #[tokio::test]
        async fn test_{}() {{
            {}
        }}
      ]], {
        i(1, "name"),
        i(2, "// Assertions"),
      })),

    }

    ls.add_snippets("rust", rust_snippets)
  '';
}
