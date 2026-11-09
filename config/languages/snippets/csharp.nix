{
  # C# snippets
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

    local csharp_snippets = {
      -- ===============================================================================
      --   LANGUAGE: Core C# Language Features
      -- ===============================================================================

      -- Console output
      s("cw", fmt('Console.WriteLine("{}");', {
        i(1, "message")
      })),

      s("write", fmt('Console.Write("{}");', {
        i(1, "message")
      })),

      -- Main method
      s("main", fmt([[
        static void Main(string[] args)
        {{
            {}
        }}
      ]], {
        i(1)
      })),

      -- Class
      s("class", fmt([[
        public class {}
        {{
            {}
        }}
      ]], {
        i(1, "ClassName"),
        i(2)
      })),

      -- Record
      s("record", fmt("public record {}({});", {
        i(1, "Person"),
        i(2, "string Name, int Age")
      })),

      -- Constructor
      s("ctor", fmt([[
        public {}({})
        {{
            {}
        }}
      ]], {
        i(1, "ClassName"),
        i(2),
        i(3)
      })),

      -- Property
      s("prop", fmt("public {} {} {{ get; set; }}", {
        i(1, "string"),
        i(2, "Name")
      })),

      -- Read-only property
      s("propr", fmt("public {} {} {{ get; }}", {
        i(1, "string"),
        i(2, "Name")
      })),

      -- Auto property with initializer
      s("propi", fmt("public {} {} {{ get; set; }} = {};", {
        i(1, "string"),
        i(2, "Name"),
        i(3, '""')
      })),

      -- Method
      s("method", fmt([[
        public {} {}({})
        {{
            {}
        }}
      ]], {
        i(1, "void"),
        i(2, "MethodName"),
        i(3),
        i(4)
      })),

      -- Async method
      s("async", fmt([[
        public async Task<{}> {}({})
        {{
            {}
        }}
      ]], {
        i(1, "string"),
        i(2, "MethodName"),
        i(3),
        i(4)
      })),

      -- Interface
      s("interface", fmt([[
        public interface I{}
        {{
            {}
        }}
      ]], {
        i(1, "Service"),
        i(2)
      })),

      -- Enum
      s("enum", fmt([[
        public enum {}
        {{
            {},
        }}
      ]], {
        i(1, "Status"),
        i(2, "Pending")
      })),

      -- Struct
      s("struct", fmt([[
        public struct {}
        {{
            {}
        }}
      ]], {
        i(1, "Point"),
        i(2)
      })),

      -- If statement
      s("if", fmt([[
        if ({})
        {{
            {}
        }}
      ]], {
        i(1, "condition"),
        i(2)
      })),

      -- If/else
      s("ife", fmt([[
        if ({})
        {{
            {}
        }}
        else
        {{
            {}
        }}
      ]], {
        i(1, "condition"),
        i(2),
        i(3)
      })),

      -- Foreach
      s("foreach", fmt([[
        foreach (var {} in {})
        {{
            {}
        }}
      ]], {
        i(1, "item"),
        i(2, "collection"),
        i(3)
      })),

      -- For loop
      s("for", fmt([[
        for (int {} = 0; {} < {}; {}++)
        {{
            {}
        }}
      ]], {
        i(1, "i"),
        i(2, "i"),
        i(3, "count"),
        i(4, "i"),
        i(5)
      })),

      -- Switch
      s("switch", fmt([[
        switch ({})
        {{
            case {}:
                {}
                break;
            default:
                {}
                break;
        }}
      ]], {
        i(1, "value"),
        i(2, "caseValue"),
        i(3),
        i(4)
      })),

      -- Try/catch
      s("try", fmt([[
          try
          {{
              {}
          }}
          catch ({} ex)
          {{
              {}
          }}
      ]], {
        i(1),
        i(2, "Exception"),
        i(3)
      })),

      -- Try/catch/finally
      s("tryf", fmt([[
        try
        {{
            {}
        }}
        catch ({} ex)
        {{
            {}
        }}
        finally
        {{
            {}
        }}
      ]], {
        i(1),
        i(2, "Exception"),
        i(3),
        i(4)
      })),

      -- Null check
      s("null", fmt([[
        if ({} is null)
        {{
            {}
        }}
      ]], {
        i(1, "value"),
        i(2)
      })),

      -- Null coalescing
      s("coalesce", fmt("{} ?? {}", {
        i(1, "value"),
        i(2, "defaultValue")
      })),

      -- Null conditional
      s("nullprop", fmt("{}?.{}", {
        i(1, "value"),
        i(2, "Property")
      })),

      -- List
      s("list", fmt("List<{}> {} = new();", {
        i(1, "string"),
        i(2, "items")
      })),

      -- Dictionary
      s("dict", fmt("Dictionary<{}, {}> {} = new();", {
        i(1, "string"),
        i(2, "int"),
        i(3, "items")
      })),

      -- Task delay
      s("delay", fmt("await Task.Delay({});", {
        i(1, "1000")
      })),

      -- Cancellation token
      s("ct", t("CancellationToken cancellationToken")),

      -- Throw exception
      s("throw", fmt('throw new {}("{}");', {
        i(1, "InvalidOperationException"),
        i(2, "Something went wrong")
      })),

      -- XML documentation
      s("summary", fmt([[
        /// <summary>
        /// {}
        /// </summary>]], {
        i(1, "Description")
      })),

      -- Debug output
      s("debug", fmt('Console.WriteLine("{}");', {
        i(1, "value")
      })),

      -- TODO
      s("todocs", fmt("// TODO: {}", {
        i(1, "Task description")
      })),

      -- Using directive
      s("using", fmt("using {};", {
        i(1, "System")
      })),

      -- Namespace
      s("namespace", fmt([[
        namespace {};

        {}]], {
        i(1, "MyNamespace"),
        i(2)
      })),

      -- ===============================================================================
      --   LANGUAGE: LINQ
      -- ===============================================================================

      -- LINQ Where
      s("where", fmt("{}.Where(x => {})", {
        i(1, "collection"),
        i(2, "condition")
      })),

      -- LINQ Select
      s("select", fmt("{}.Select(x => {})", {
        i(1, "collection"),
        i(2, "x")
      })),

      -- LINQ FirstOrDefault
      s("first", fmt("{}.FirstOrDefault(x => {})", {
        i(1, "collection"),
        i(2, "condition")
      })),

      -- LINQ OrderBy
      s("orderby", fmt("{}.OrderBy(x => {})", {
        i(1, "collection"),
        i(2, "x.Property")
      })),

      -- LINQ ToList
      s("tolist", fmt("{}.ToList()", {
        i(1, "collection")
      })),

      -- LINQ Any
      s("any", fmt("{}.Any(x => {})", {
        i(1, "collection"),
        i(2, "condition")
      })),

      -- LINQ All
      s("all", fmt("{}.All(x => {})", {
        i(1, "collection"),
        i(2, "condition")
      })),

      -- LINQ Count
      s("count", fmt("{}.Count(x => {})", {
        i(1, "collection"),
        i(2, "condition")
      })),

      -- LINQ Sum
      s("sum", fmt("{}.Sum(x => {})", {
        i(1, "collection"),
        i(2, "x")
      })),

      -- LINQ Average
      s("avg", fmt("{}.Average(x => {})", {
        i(1, "collection"),
        i(2, "x")
      })),

      -- LINQ GroupBy
      s("groupby", fmt("{}.GroupBy(x => {})", {
        i(1, "collection"),
        i(2, "x.Property")
      })),

      -- LINQ Distinct
      s("distinct", fmt("{}.Distinct()", {
        i(1, "collection")
      })),

      -- LINQ Skip/Take
      s("skip", fmt("{}.Skip({})", {
        i(1, "collection"),
        i(2, "10")
      })),

      s("take", fmt("{}.Take({})", {
        i(1, "collection"),
        i(2, "10")
      })),

      -- LINQ Concat
      s("concat", fmt("{}.Concat({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Union
      s("union", fmt("{}.Union({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Intersect
      s("intersect", fmt("{}.Intersect({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Except
      s("except", fmt("{}.Except({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ OrderByDescending
      s("orderbydesc", fmt("{}.OrderByDescending(x => {})", {
        i(1, "collection"),
        i(2, "x.Property")
      })),

      -- LINQ ThenBy
      s("thenby", fmt("{}.ThenBy(x => {})", {
        i(1, "collection"),
        i(2, "x.Property")
      })),

      -- LINQ ThenByDescending
      s("thenbydesc", fmt("{}.ThenByDescending(x => {})", {
        i(1, "collection"),
        i(2, "x.Property")
      })),

      -- LINQ First/Last
      s("first", fmt("{}.First()", {
        i(1, "collection")
      })),

      s("last", fmt("{}.Last()", {
        i(1, "collection")
      })),

      -- LINQ Single/SingleOrDefault
      s("single", fmt("{}.Single()", {
        i(1, "collection")
      })),

      s("singled", fmt("{}.SingleOrDefault()", {
        i(1, "collection")
      })),

      -- LINQ Contains
      s("contains", fmt("{}.Contains({})", {
        i(1, "collection"),
        i(2, "item")
      })),

      -- LINQ DefaultIfEmpty
      s("defaultifempty", fmt("{}.DefaultIfEmpty({})", {
        i(1, "collection"),
        i(2, "defaultValue")
      })),

      -- LINQ Reverse
      s("reverse", fmt("{}.Reverse()", {
        i(1, "collection")
      })),

      -- LINQ Union/Intersect/Except (overload)
      s("union", fmt("{}.Union({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Zip
      s("zip", fmt("{}.Zip({}, {}, (x, y) => {{}})", {
        i(1, "collection1"),
        i(2, "collection2"),
        i(3, "result")
      })),

      -- LINQ Aggregate
      s("aggregate", fmt("{}.Aggregate({}, (acc, x) => {{}})", {
        i(1, "collection"),
        i(2, "seed")
      })),

      -- LINQ SkipWhile/TakeWhile
      s("skipwhile", fmt("{}.SkipWhile(x => {})", {
        i(1, "collection"),
        i(2, "condition")
      })),

      s(" takewhile", fmt("{}.TakeWhile(x => {})", {
        i(1, "collection"),
        i(2, "condition")
      })),

      -- LINQ OfType
      s("oftype", fmt("{}.OfType<{}>()", {
        i(1, "collection"),
        i(2, "Type")
      })),

      -- LINQ Cast
      s("cast", fmt("{}.Cast<{}>()", {
        i(1, "collection"),
        i(2, "Type")
      })),

      -- LINQ Range
      s("range", fmt("Enumerable.Range({}, {})", {
        i(1, "0"),
        i(2, "10")
      })),

      -- LINQ Repeat
      s("repeat", fmt("Enumerable.Repeat({}, {})", {
        i(1, "value"),
        i(2, "count")
      })),

      -- LINQ Empty
      s("empty", fmt("Enumerable.Empty<{}>()", {
        i(1, "Type")
      })),

      -- LINQ SequenceEqual
      s("seqequal", fmt("{}.SequenceEqual({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Except
      s("except", fmt("{}.Except({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Intersect
      s("intersect", fmt("{}.Intersect({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Union
      s("union", fmt("{}.Union({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Concat
      s("concat", fmt("{}.Concat({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Zip
      s("zip", fmt("{}.Zip({}, {}, (x, y) => {{}})", {
        i(1, "collection1"),
        i(2, "collection2"),
        i(3, "result")
      })),

      -- LINQ Aggregate
      s("aggregate", fmt("{}.Aggregate({}, (acc, x) => {{}})", {
        i(1, "collection"),
        i(2, "seed")
      })),

      -- LINQ SkipWhile/TakeWhile
      s("skipwhile", fmt("{}.SkipWhile(x => {})", {
        i(1, "collection"),
        i(2, "condition")
      })),

      s("takewhile", fmt("{}.TakeWhile(x => {})", {
        i(1, "collection"),
        i(2, "condition")
      })),

      -- LINQ OfType
      s("oftype", fmt("{}.OfType<{}>()", {
        i(1, "collection"),
        i(2, "Type")
      })),

      -- LINQ Cast
      s("cast", fmt("{}.Cast<{}>()", {
        i(1, "collection"),
        i(2, "Type")
      })),

      -- LINQ Range
      s("range", fmt("Enumerable.Range({}, {})", {
        i(1, "0"),
        i(2, "10")
      })),

      -- LINQ Repeat
      s("repeat", fmt("Enumerable.Repeat({}, {})", {
        i(1, "value"),
        i(2, "count")
      })),

      -- LINQ Empty
      s("empty", fmt("Enumerable.Empty<{}>()", {
        i(1, "Type")
      })),

      -- LINQ SequenceEqual
      s("seqequal", fmt("{}.SequenceEqual({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Except
      s("except", fmt("{}.Except({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Intersect
      s("intersect", fmt("{}.Intersect({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Union
      s("union", fmt("{}.Union({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Concat
      s("concat", fmt("{}.Concat({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- LINQ Zip
      s("zip", fmt("{}.Zip({}, {}, (x, y) => {{}})", {
        i(1, "collection1"),
        i(2, "collection2"),
        i(3, "result")
      })),

      -- LINQ Aggregate
      s("aggregate", fmt("{}.Aggregate({}, (acc, x) => {{}})", {
        i(1, "collection"),
        i(2, "seed")
      })),

      -- LINQ SkipWhile/TakeWhile
      s("skipwhile", fmt("{}.SkipWhile(x => {})", {
        i(1, "collection"),
        i(2, "condition")
      })),

      s("takewhile", fmt("{}.TakeWhile(x => {})", {
        i(1, "collection"),
        i(2, "condition")
      })),

      -- LINQ OfType
      s("oftype", fmt("{}.OfType<{}>()", {
        i(1, "collection"),
        i(2, "Type")
      })),

      -- LINQ Cast
      s("cast", fmt("{}.Cast<{}>()", {
        i(1, "collection"),
        i(2, "Type")
      })),

      -- LINQ Range
      s("range", fmt("Enumerable.Range({}, {})", {
        i(1, "0"),
        i(2, "10")
      })),

      -- LINQ Repeat
      s("repeat", fmt("Enumerable.Repeat({}, {})", {
        i(1, "value"),
        i(2, "count")
      })),

      -- LINQ Empty
      s("empty", fmt("Enumerable.Empty<{}>()", {
        i(1, "Type")
      })),

      -- LINQ SequenceEqual
      s("seqequal", fmt("{}.SequenceEqual({})", {
        i(1, "collection1"),
        i(2, "collection2")
      })),

      -- ===============================================================================
      --   TYPES: Type Definitions
      -- ===============================================================================

      -- Type alias
      s("type", fmt("type {} = {}", {
        i(1, "TypeName"),
        i(2),
      })),

      -- Interface
      s("interface", fmt([[
        public interface I{}
        {{
            {}
        }}
      ]], {
        i(1, "Service"),
        i(2)
      })),

      -- Struct
      s("struct", fmt([[
        public struct {}
        {{
            {}
        }}
      ]], {
        i(1, "Point"),
        i(2)
      })),

      -- Class
      s("class", fmt([[
        public class {}
        {{
            {}
        }}
      ]], {
        i(1, "ClassName"),
        i(2)
      })),

      -- ===============================================================================
      --   LIBRARIES: xUnit
      -- ===============================================================================

      -- Unit test (xUnit)
      s("test", fmt([[
          [Fact]
          public void {}()
          {{
              // Arrange
              {}

              // Act
              {}

              // Assert
              {}
          }}
      ]], {
        i(1, "ShouldDoSomething"),
        i(2),
        i(3),
        i(4)
      })),

      -- Theory test (xUnit)
      s("theory", fmt([[
          [Theory]
          [InlineData({}, {})]
          public void {}({}, {})
          {{
              // Arrange

              // Act

              // Assert
              {}
          }}
      ]], {
        i(1, "input"),
        i(2, "expected"),
        i(3, "ShouldReturnExpected"),
        i(4, "string input"),
        i(5, "string expected"),
        i(6)
      })),

    }

    ls.add_snippets("cs", csharp_snippets)
  '';
}
