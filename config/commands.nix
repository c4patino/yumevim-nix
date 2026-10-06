{
  extraConfigLua = ''
    local placeholder = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="

    local function replace_hashes()
      local buf = vim.api.nvim_get_current_buf()
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      local changed = false
      local count = 0

      for i, line in ipairs(lines) do
        local updated = line:gsub("sha256%-[A-Za-z0-9+/]+=?", function(match)
          if #match < 50 or match == placeholder then
            return match
          end
          count = count + 1
          return placeholder
        end)

        if updated ~= line then
          lines[i] = updated
          changed = true
        end
      end

      if not changed then
        vim.notify("No hashes to replace", vim.log.levels.INFO)
        return
      end

      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      vim.notify(
        string.format("Replaced %d hash%s", count, count == 1 and "" or "es"),
        vim.log.levels.INFO
      )
    end

    vim.api.nvim_create_user_command("ReplaceHashes", replace_hashes, {
      desc = "Replace all sha256 hashes in the current file with a placeholder",
    })
  '';
}
