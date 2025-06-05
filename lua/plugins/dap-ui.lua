return {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    ft = { "cpp, c", "cxx", "h", "hpp" },
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup({})

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
    endopts = {},
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

  { "stevearc/overseer.nvim", ft = { "cpp", "c", "cxx", "h", "hpp" }, event = "VeryLazy", opts = {} },
}
