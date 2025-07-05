{
  plugins.lualine = {
    enable = true;

    settings = {
      options = {
        globalstatus = true;
        always_divide_middle = true;
        theme = "auto";
        ignore_focus = ["nvim-tree"];

        component_separators = {
          left = "|";
          right = "|";
        };
      };

      extensions = ["fzf"];

      sections = {
        lualine_a = ["mode"];
        lualine_b = [
          {
            __unkeyed = "branch";
            icon = "";
            icons_enabled = true;
          }
          "diff"
          "diagnostics"
        ];
        lualine_c = [
          "filename"
          {
            __raw = ''
              function()
              local rec = vim.fn.reg_recording()
              if rec ~= "" then
                return " @" .. rec
                  end
                  return ""
                  end
            '';
          }
        ];
        lualine_x = ["filetype"];
        lualine_y = ["location"];
        lualine_z = [''" " .. os.date("%R")''];
      };
    };
  };
}
