{
  # Common snippets for all file types
  extraConfigLua = ''
    local ls = require("luasnip")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local fmt = require("luasnip.extras.fmt").fmt

    -- Common snippets for all filetypes
    local common_snippets = {
      -- Current date
      s("date", {
        f(function()
          return os.date("%Y-%m-%d")
        end)
      }),

      -- Current date and time
      s("datetime", {
        f(function()
          return os.date("%Y-%m-%d %H:%M:%S")
        end)
      }),

      -- TODO comment using the file's comment style
      s("todo", {
        f(function()
          local comment = vim.bo.commentstring:gsub("%%s", " TODO: ")
          return comment
        end),
        i(1, "Task description")
      }),

      -- FIXME comment using the file's comment style
      s("fixme", {
        f(function()
          local comment = vim.bo.commentstring:gsub("%%s", " FIXME: ")
          return comment
        end),
        i(1, "Issue description")
      }),

      -- Box comment for section headers
      s("box", {
        f(function()
          local width = 80
          local comment_str = vim.bo.commentstring:gsub("%%s", "")
          comment_str = comment_str:gsub("%s+$", "")

          local line = string.rep("=", width - #comment_str)
          return comment_str .. line
        end),
        t({"", ""}),
        f(function()
          return vim.bo.commentstring:gsub("%%s", " ")
        end),
        i(1, "Section Title"),
        t({"", ""}),
        f(function()
          local width = 80
          local comment_str = vim.bo.commentstring:gsub("%%s", "")
          comment_str = comment_str:gsub("%s+$", "")

          local line = string.rep("=", width - #comment_str)
          return comment_str .. line
        end)
      }),

      -- UUID generation
      s("uuid", {
        f(function()
          math.randomseed(os.time())
          local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
          return string.gsub(template, "[xy]", function(c)
            local v = (c == "x") and math.random(0, 0xf) or math.random(8, 0xb)
            return string.format("%x", v)
          end)
        end)
      })
    }

    -- Add these snippets to all filetypes
    ls.add_snippets("all", common_snippets)
  '';
}
