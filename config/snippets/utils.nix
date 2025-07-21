{
  extraConfigLua = ''
    -- Common utility functions for snippets

    -- Get comment string for current filetype
    local function get_comment_string()
      local comment_string = vim.bo.commentstring
      if not comment_string or comment_string == "" then
        return "-- %s" -- Default to Lua style comments
      end
      return comment_string
    end

    -- Get visual selection
    local function get_visual_selection()
      local visual_modes = {
        v = true,
        V = true,
        ["\22"] = true -- CTRL+V
      }

      if not visual_modes[vim.api.nvim_get_mode().mode] then
        return ""
      end

      local _, ls, cs = unpack(vim.fn.getpos("v"))
      local _, le, ce = unpack(vim.fn.getpos("."))

      -- Normalize positions
      if ls > le or (ls == le and cs > ce) then
        ls, le = le, ls
        cs, ce = ce, cs
      end

      local lines = vim.api.nvim_buf_get_lines(0, ls - 1, le, false)
      if #lines == 0 then
        return ""
      end

      -- Adjust for partial lines
      lines[1] = string.sub(lines[1], cs, -1)
      if #lines > 1 then
        lines[#lines] = string.sub(lines[#lines], 1, ce)
      else
        lines[1] = string.sub(lines[1], 1, ce - cs + 1)
      end

      return table.concat(lines, "\n")
    end

    -- Format date in various ways
    local function date_format(format)
      return os.date(format)
    end

    -- Capture groups from regex matches
    local function capture_match(match, group)
      if match and #match > group then
        return match[group + 1]
      end
      return ""
    end

    -- Check if the current buffer is a test file
    local function is_test_file()
      local filename = vim.fn.expand("%:t")
      return string.match(filename, "[tT]est") ~= nil or string.match(filename, "_test") ~= nil or string.match(filename, "spec") ~= nil
    end

    -- Make these functions available to snippets
    _G.snippet_utils = {
      get_comment_string = get_comment_string,
      get_visual_selection = get_visual_selection,
      date_format = date_format,
      capture_match = capture_match,
      is_test_file = is_test_file
    }
  '';
}
