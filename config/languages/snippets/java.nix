{
  # Java snippets
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

    local java_snippets = {
      -- ===============================================================================
      --   LANGUAGE: Core Java Language Features
      -- ===============================================================================

      -- Console output
      s("sout", fmt('System.out.println("{}");', {
        i(1, "message")
      })),

      s("soutv", fmt('System.out.println({});', {
        i(1, "value")
      })),

      s("serr", fmt('System.err.println("{}");', {
        i(1, "error")
      })),

      -- Main method
      s("main", fmt([[
        public static void main(String[] args) {{
            {}
        }}]], {
        i(1)
      })),

      -- Class
      s("class", fmt([[
        public class {} {{
            {}
        }}]], {
        i(1, "ClassName"),
        i(2)
      })),

      -- Class with constructor
      s("classctor", fmt([[
        public class {} {{
            {}

            public {}({}) {{
                {}
            }}
        }}]], {
        i(1, "ClassName"),
        i(2),
        i(3, "ClassName"),
        i(4),
        i(5)
      })),

      -- Constructor
      s("ctor", fmt([[
        public {}({}) {{
            {}
        }}]], {
        i(1, "ClassName"),
        i(2),
        i(3)
      })),

      -- Method
      s("method", fmt([[
        public {} {}({}) {{
            {}
        }}]], {
        i(1, "void"),
        i(2, "methodName"),
        i(3),
        i(4)
      })),

      -- Static method
      s("static", fmt([[
        public static {} {}({}) {{
            {}
        }}]], {
        i(1, "void"),
        i(2, "methodName"),
        i(3),
        i(4)
      })),

      -- Interface
      s("interface", fmt([[
        public interface {} {{
            {}
        }}]], {
        i(1, "MyInterface"),
        i(2)
      })),

      -- Enum
      s("enum", fmt([[
        public enum {} {{
            {}
        }}]], {
        i(1, "Status"),
        i(2, "PENDING, ACTIVE, COMPLETE")
      })),

      -- Record (Java 16+)
      s("record", fmt("public record {}({}) {{}}", {
        i(1, "Person"),
        i(2, "String name, int age")
      })),

      -- If statement
      s("if", fmt([[
        if ({}) {{
            {}
        }}]], {
        i(1, "condition"),
        i(2)
      })),

      -- If/else
      s("ife", fmt([[
        if ({}) {{
            {}
        }} else {{
            {}
        }}]], {
        i(1, "condition"),
        i(2),
        i(3)
      })),

      -- For loop
      s("for", fmt([[
        for (int {} = 0; {} < {}; {}++) {{
            {}
        }}]], {
        i(1, "i"),
        i(2, "i"),
        i(3, "count"),
        i(4, "i"),
        i(5)
      })),

      -- Enhanced for loop
      s("foreach", fmt([[
        for ({} {} : {}) {{
            {}
        }}]], {
        i(1, "String"),
        i(2, "item"),
        i(3, "items"),
        i(4)
      })),

      -- While loop
      s("while", fmt([[
        while ({}) {{
            {}
        }}]], {
        i(1, "condition"),
        i(2)
      })),

      -- Switch expression (Java 14+)
      s("switch", fmt([[
        return switch ({}) {{
            case {} -> {};
            case {} -> {};
            default -> {};
        }};]], {
        i(1, "value"),
        i(2, "FIRST"),
        i(3, "result1"),
        i(4, "SECOND"),
        i(5, "result2"),
        i(6, "defaultResult")
      })),

      -- Try/catch
      s("try", fmt([[
        try {{
            {}
        }} catch ({} e) {{
            {}
        }}]], {
        i(1),
        i(2, "Exception"),
        i(3)
      })),

      -- Try with resources
      s("tryr", fmt([[
        try ({} {}) {{
            {}
        }} catch ({} e) {{
            {}
        }}]], {
        i(1, "var"),
        i(2, "resource"),
        i(3),
        i(4, "Exception"),
        i(5)
      })),

      -- Throw exception
      s("throw", fmt('throw new {}("{}");', {
        i(1, "IllegalArgumentException"),
        i(2, "Invalid argument")
      })),

      -- Lambda
      s("lambda", fmt("({}) -> {}", {
        i(1, "item"),
        i(2, "expression")
      })),

      -- ForEach
      s("forEach", fmt("{}.forEach({} -> {});", {
        i(1, "collection"),
        i(2, "item"),
        i(3, "System.out.println(item)")
      })),

      -- Package
      s("package", fmt("package {};", {
        i(1, "com.example")
      })),

      -- Import
      s("import", fmt("import {};", {
        i(1, "java.util.List")
      })),

      -- Annotation
      s("override", t("@Override")),
      s("deprecated", t("@Deprecated")),

      -- ===============================================================================
      --   TYPES: Type Definitions
      -- ===============================================================================

      -- Class
      s("class", fmt([[
        public class {} {{
            {}
        }}]], {
        i(1, "ClassName"),
        i(2)
      })),

      -- Abstract class
      s("abstract", fmt([[
        public abstract class {} {{
            {}

            public abstract {} {}({});
        }}]], {
        i(1, "BaseClass"),
        i(2),
        i(3, "void"),
        i(4, "methodName"),
        i(5)
      })),

      -- Interface
      s("interface", fmt([[
        public interface {} {{
            {}
        }}]], {
        i(1, "MyInterface"),
        i(2)
      })),

      -- Enum
      s("enum", fmt([[
        public enum {} {{
            {}
        }}]], {
        i(1, "Status"),
        i(2, "PENDING, ACTIVE, COMPLETE")
      })),

      -- ===============================================================================
      --   LIBRARIES: JUnit 5
      -- ===============================================================================

      -- JUnit 5 test
      s("test", fmt([[
        @Test
        void {}() {{
            // Arrange
            {}

            // Act
            {}

            // Assert
            {}
        }}]], {
        i(1, "shouldDoSomething"),
        i(2),
        i(3),
        i(4)
      })),

      -- JUnit 5 parameterized test
      s("ptest", fmt([[
        @ParameterizedTest
        @ValueSource(strings = {{{}}})
        void {}(String {}) {{
            {}
        }}]], {
        i(1, '"value1", "value2"'),
        i(2, "shouldHandleValue"),
        i(3, "value"),
        i(4)
      })),

      -- Assertions
      s("assert", fmt("assertEquals({}, {});", {
        i(1, "expected"),
        i(2, "actual")
      })),

      s("asserttrue", fmt("assertTrue({});", {
        i(1, "condition")
      })),

    }

    ls.add_snippets("java", java_snippets)
  '';
}
