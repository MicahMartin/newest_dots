return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {},
    config = function()
      local dap = require("dap")
      dap.adapters.codelldb = {
        type = "executable",
        command = "codelldb",
        args = {},
      }
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = true,
    event = "VeryLazy",
    ft = { "cpp, c", "cxx", "h", "hpp" },
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({ ---@type dapui.Config
        controls = {
          enabled = true,
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
          border = "single",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        force_buffers = true,
        icons = {
          collapsed = "󰞔",
          current_frame = "",
          expanded = "󰞒",
        },
        layouts = {
          {
            elements = {
              {
                id = "stacks",
                size = 0.25,
              },
              {
                id = "watches",
                size = 0.25,
              },
              {
                id = "scopes",
                size = 0.50,
              },
            },
            position = "right",
            size = 0.30,
          },
          {
            elements = {
              {
                id = "console",
                size = 0.5,
              },
              {
                id = "repl",
                size = 0.5,
              },
            },
            position = "bottom",
            size = 0.25,
          },
        },
        mappings = {
          edit = "e",
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          repl = "r",
          toggle = "t",
        },
        render = {
          indent = 1,
          max_value_lines = 100,
        },
      })
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
-- {
--   "igorlfs/nvim-dap-view",
--   ---@module 'dap-view'
--   ---@type dapview.Config
--   opts = {
--
--     sections = { "watches", "scopes", "repl", "console" },
--     winbar = {
--       default_section = "console",
--     },
--     windows = {
--       height = 12,
--       position = "below",
--       terminal = {
--         position = "left",
--         width = 0.5,
--         -- List of debug adapters for which the terminal should be ALWAYS hidden
--         hide = {},
--         -- Hide the terminal when starting a new session
--         start_hidden = false,
--       },
--     },
--   },
--   config = function()
--     local dap, dv = require("dap"), require("dap-view")
--     dap.listeners.before.attach["dap-view-config"] = function()
--       dv.open()
--     end
--     dap.listeners.before.launch["dap-view-config"] = function()
--       dv.open()
--     end
--     dap.listeners.before.event_terminated["dap-view-config"] = function()
--       dv.close()
--     end
--     dap.listeners.before.event_exited["dap-view-config"] = function()
--       dv.close()
--     end
--   end,
-- },
