{pkgs, ...}: {
  keymaps = [
    {
      mode = "n";
      key = "<leader>db";
      action.__raw = "function() require('dap').toggle_breakpoint() end";
      options = {
        silent = true;
        desc = "Toggle Breakpoint";
      };
    }
    {
      mode = "n";
      key = "<leader>dB";
      action.__raw = "function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end";
      options = {
        silent = true;
        desc = "Toggle Conditional Breakpoint";
      };
    }
    {
      mode = "n";
      key = "<leader>dc";
      action.__raw = "function() require('dap').continue() end";
      options = {
        silent = true;
        desc = "Continue";
      };
    }
    {
      mode = "n";
      key = "<leader>da";
      action.__raw = "function() require('dap').continue({ before = get_args }) end";
      options = {
        silent = true;
        desc = "Run with Args";
      };
    }
    {
      mode = "n";
      key = "<leader>dC";
      action.__raw = "function() require('dap').run_to_cursor() end";
      options = {
        silent = true;
        desc = "Run to cursor";
      };
    }
    {
      mode = "n";
      key = "<leader>dg";
      action.__raw = "function() require('dap').goto_() end";
      options = {
        silent = true;
        desc = "Go to line (no execute)";
      };
    }
    {
      mode = "n";
      key = "<leader>di";
      action.__raw = "function() require('dap').step_into() end";
      options = {
        silent = true;
        desc = "Step into";
      };
    }
    {
      mode = "n";
      key = "<leader>dj";
      action.__raw = "function() require('dap').down() end";
      options = {
        silent = true;
        desc = "Down";
      };
    }
    {
      mode = "n";
      key = "<leader>dk";
      action.__raw = "function() require('dap').up() end";
      options = {
        silent = true;
        desc = "Up";
      };
    }
    {
      mode = "n";
      key = "<leader>dl";
      action.__raw = "function() require('dap').run_last() end";
      options = {
        silent = true;
        desc = "Run Last";
      };
    }
    {
      mode = "n";
      key = "<leader>do";
      action.__raw = "function() require('dap').step_out() end";
      options = {
        silent = true;
        desc = "Step Out";
      };
    }
    {
      mode = "n";
      key = "<leader>dO";
      action.__raw = "function() require('dap').step_over() end";
      options = {
        silent = true;
        desc = "Step Over";
      };
    }
    {
      mode = "n";
      key = "<leader>dp";
      action.__raw = "function() require('dap').pause() end";
      options = {
        silent = true;
        desc = "Pause";
      };
    }
    {
      mode = "n";
      key = "<leader>dr";
      action.__raw = "function() require('dap').repl.toggle() end";
      options = {
        silent = true;
        desc = "Toggle REPL";
      };
    }
    {
      mode = "n";
      key = "<leader>ds";
      action.__raw = "function() require('dap').session() end";
      options = {
        silent = true;
        desc = "Session";
      };
    }
    {
      mode = "n";
      key = "<leader>dt";
      action.__raw = "function() require('dap').terminate() end";
      options = {
        silent = true;
        desc = "Terminate";
      };
    }
    {
      mode = "n";
      key = "<leader>du";
      action.__raw = "function() require('dapui').toggle() end";
      options = {
        silent = true;
        desc = "Dap UI";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>de";
      action.__raw = "function() require('dapui').eval() end";
      options = {
        silent = true;
        desc = "Eval";
      };
    }
  ];

  plugins = {
    dap = {
      enable = true;
      adapters = {
        servers = {
          codelldb = {
            port = 13000;
            executable = {
              command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
              args = ["--port" "13000"];
            };
          };
          go = {
            port = 38697;
            executable = {
              command = "${pkgs.delve}/bin/dlv";
              args = ["dap" "-l" "127.0.0.1:38697"];
            };
          };
          pwa-node = {
            port = 9229;
            executable = {
              command = "${pkgs.vscode-js-debug}/bin/js-debug";
              args = ["9229" "127.0.0.1"];
            };
          };
        };
      };
      configurations = let
        exeConfigs = [
          {
            type = "codelldb";
            request = "launch";
            name = "exe";
            program.__raw = ''function() return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/target/debug/", "file") end'';
            cwd.__raw = ''function() return vim.fn.getcwd() end'';
          }
          {
            type = "codelldb";
            request = "launch";
            name = "exe:args";
            program.__raw = ''function() return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/target/debug/", "file") end '';
            cwd.__raw = ''function() return vim.fn.getcwd() end '';
            args.__raw = ''function() return vim.fn.split(vim.fn.input("Arguments: "), " ") end'';
          }
          {
            type = "codelldb";
            request = "attach";
            name = "attach";
            connect.__raw = ''function() return vim.fn.input("Host: ") end'';
            cwd.__raw = ''function() return vim.fn.getcwd() end'';
          }
        ];

        webConfigs = [
          {
            type = "pwa-node";
            request = "launch";
            name = "current";
            program = "\${file}";
            cwd.__raw = ''function() return vim.fn.getcwd() end'';
          }
          {
            type = "pwa-node";
            request = "launch";
            name = "current:args";
            program = "\${file}";
            cwd.__raw = ''function() return vim.fn.getcwd() end'';
            args.__raw = ''function() return vim.fn.split(vim.fn.input("Arguments: "), " ") end'';
          }
          {
            type = "pwa-node";
            request = "launch";
            name = "file";
            program.__raw = ''function() return vim.fn.input("Executable: ", vim.fn.getcwd(), "file") end '';
            cwd.__raw = ''function() return vim.fn.getcwd() end'';
          }
          {
            type = "pwa-node";
            request = "launch";
            name = "file:args";
            program.__raw = ''function() return vim.fn.input("Executable: ", vim.fn.getcwd(), "file") end '';
            cwd.__raw = ''function() return vim.fn.getcwd() end'';
            args.__raw = ''function() return vim.fn.split(vim.fn.input("Arguments: "), " ") end'';
          }
          {
            type = "pwa-node";
            request = "attach";
            name = "attach";
            connect.__raw = ''function() return vim.fn.input("Host: ") end'';
            cwd.__raw = ''function() return vim.fn.getcwd() end'';
          }
        ];
      in {
        python = let
          findPython = ''
            function()
              local cwd = vim.fn.getcwd()
              if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                return cwd .. "/venv/bin/python"
              elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                return cwd .. "/.venv/bin/python"
              else
                return "python3"
              end
            end
          '';
        in [
          {
            type = "python";
            request = "launch";
            name = "module";
            module.__raw = ''function() return vim.fn.input("Module: ") end '';
            pythonPath.__raw = findPython;
          }
          {
            type = "python";
            request = "launch";
            name = "module:args";
            module.__raw = ''function() return vim.fn.input("Module: ") end '';
            args.__raw = ''function() return vim.fn.split(vim.fn.input("Arguments: "), " ") end'';
            pythonPath.__raw = findPython;
          }
        ];
        c = exeConfigs;
        cpp = exeConfigs;
        rust = exeConfigs;
        zig = exeConfigs;
        go = [
          {
            type = "go";
            request = "launch";
            name = "file";
            program = "\${file}";
            outputMode = "remote";
          }
          {
            type = "go";
            request = "launch";
            name = "file:args";
            program = "\${file}";
            args.__raw = ''function() return vim.fn.split(vim.fn.input("Arguments: "), " ") end'';
            outputMode = "remote";
          }
          {
            type = "go";
            mode = "remote";
            request = "attach";
            name = "attach";
            connect.__raw = ''
              function()
                local input = vim.fn.input("Host: ")
                local host, port = string.match(input, "([^:]+):(%d+)")
                return { host = host, port = tonumber(port) }
              end
            '';
            cwd.__raw = ''function() return vim.fn.getcwd() end'';
          }
        ];

        javascript = webConfigs;
        javascriptreact = webConfigs;
        typescript = webConfigs;
        typescriptreact = webConfigs;
      };
      signs = {
        dapBreakpoint = {
          text = "●";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "⏹";
          texthl = "DapBreakpointCondition";
        };
        dapLogPoint = {
          text = "◆";
          texthl = "DapLogPoint";
        };
      };
    };

    dap-ui = {
      enable = true;

      settings.floating.mappings = {
        close = ["<Esc>" "q"];
      };
    };

    dap-python.enable = true;
    dap-lldb = {
      enable = true;
      settings.codelldb_path = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
    };
  };
}
