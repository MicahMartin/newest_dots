M = {
  { "neovim/nvim-lspconfig", lazy = false },
  {
    "mfussenegger/nvim-dap",
    dependencies = {},
    keys = {
      {
        "<leader>an",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>ao",
        function()
          require("dap").continue()
        end,
        desc = "step over",
      },
      {
        "<leader>ai",
        function()
          require("dap").continue()
        end,
        desc = "step into",
      },
      {
        "<leader>ab",
        function()
          require("dap").continue()
        end,
        desc = "step back",
      },
      {
        "<leader>ag",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>aF",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate dap",
      },
      {
        "<leader>aR",
        function()
          require("dap").restart()
        end,
        desc = "restart dap",
      },
      {
        "<leader>ak",
        function()
          require("dapui").eval(nil, { enter = true })
        end,
        desc = "Dap symbol view",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
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
    "Weissle/persistent-breakpoints.nvim",
    config = function()
      require("persistent-breakpoints").setup({
        load_breakpoints_event = { "BufReadPost" },
      })
      local opts = { noremap = true, silent = true }
      local keymap = vim.api.nvim_set_keymap
      -- Save breakpoints to file automatically.
      keymap(
        "n",
        "<leader>ad",
        "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
        vim.tbl_extend("force", opts, { desc = "Toggle breakpoint on/off" })
      )
      keymap(
        "n",
        "<leader>ac",
        "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
        vim.tbl_extend("force", opts, { desc = "Set Conditional breakpoint" })
      )
      keymap("n", "<leader>aL", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)
      keymap(
        "n",
        "<leader>as",
        "<cmd>lua require('persistent-breakpoints.api').set_log_point()<cr>",
        vim.tbl_extend("force", opts, { desc = "Set Log Point" })
      )
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    ---@type MasonNvimDapSettings
    opts = {
      -- This line is essential to making automatic installation work
      -- :exploding-brain
      handlers = {},
      --automatic_installation = {
      --	-- These will be configured by separate plugins.
      --	exclude = {
      --		"delve",
      --		"python",
      --	},
      --},
      -- DAP servers: Mason will be invoked to install these if necessary.
      ensure_installed = {
        "codelldb",
        --"python",
      },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = true,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "stevearc/overseer.nvim",
    opts = {},
  },
  { "catgoose/nvim-colorizer.lua", event = "BufReadPre", opts = {} },
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  { "jay-babu/mason-nvim-dap.nvim" },

  { "rafamadriz/friendly-snippets" },
}

return M
