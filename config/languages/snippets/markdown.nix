{
  # Markdown snippets
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt

    local markdown_snippets = {
      -- Headings
      s("h1", fmt("# {}", { i(1, "Heading") })),
      s("h2", fmt("## {}", { i(1, "Heading") })),
      s("h3", fmt("### {}", { i(1, "Heading") })),
      s("h4", fmt("#### {}", { i(1, "Heading") })),

      -- Text formatting
      s("bold", fmt("**{}**", { i(1, "text") })),
      s("italic", fmt("*{}*", { i(1, "text") })),
      s("strike", fmt("~~{}~~", { i(1, "text") })),
      s("inlinecode", fmt("`{}`", { i(1, "code") })),

      -- Links and images
      s("link", fmt("[{}]({})", {
        i(1, "link text"),
        i(2, "https://example.com")
      })),
      s("image", fmt("![{}]({})", {
        i(1, "alt text"),
        i(2, "image URL")
      })),

      -- Code blocks
      s("codeblock", fmt([[
        ```{}
        {}
        ```]], {
        i(1, "language"),
        i(2, "code")
      })),

      -- Lists
      s("ul", fmt("- {}", { i(1, "List item") })),
      s("ol", fmt("1. {}", { i(1, "List item") })),
      s("task", fmt("- [ ] {}", { i(1, "Task") })),
      s("taskdone", fmt("- [x] {}", { i(1, "Completed task") })),

      -- Blockquotes
      s("quote", fmt("> {}", { i(1, "Quote") })),

      -- Horizontal rule
      s("hr", t("---")),

      -- Tables
      s("table", fmt([[
          | {} | {} |
          | --- | --- |
          | {} | {} |
          ]], {
        i(1, "Header 1"),
        i(2, "Header 2"),
        i(3, "Cell 1"),
        i(4, "Cell 2")
      })),

      -- Collapsible section
      s("details", fmt([[
          <details>
          <summary>{}</summary>

          {}

          </details>]], {
        i(1, "Click to expand"),
        i(2, "Hidden content")
      })),

      -- Footnote
      s("footnote", fmt("[^{}]: {}", {
        i(1, "1"),
        i(2, "Footnote text")
      })),

      -- Definition-style note
      s("note", fmt("> [!NOTE]\n> {}", {
        i(1, "Note content")
      })),

      s("warning", fmt("> [!WARNING]\n> {}", {
        i(1, "Warning content")
      })),

      s("tip", fmt("> [!TIP]\n> {}", {
        i(1, "Tip content")
      })),
    }

    ls.add_snippets("markdown", markdown_snippets)
  '';
}
