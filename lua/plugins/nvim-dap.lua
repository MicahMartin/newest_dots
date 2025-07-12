return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    ft = { "cpp, c", "cxx", "h", "hpp" },
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
    "Weissle/persistent-breakpoints.nvim",
    event = "VeryLazy",
    ft = { "cpp, c", "cxx", "h", "hpp" },
    config = function()
      require("persistent-breakpoints").setup({
        load_breakpoints_event = { "BufReadPost" },
      })
      local opts = { noremap = true, silent = true }
      local keymap = vim.api.nvim_set_keymap
      -- Save breakpoints to file automatically.
      keymap(
        "n",
        "<F1>",
        "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
        vim.tbl_extend("force", opts, { desc = "Toggle breakpoint on/off" })
      )
      keymap(
        "n",
        "<F2>",
        "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
        vim.tbl_extend("force", opts, { desc = "Set Conditional breakpoint" })
      )
      keymap("n", "<leader>aL", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)
      keymap(
        "n",
        "<F3>",
        "<cmd>lua require('persistent-breakpoints.api').set_log_point()<cr>",
        vim.tbl_extend("force", opts, { desc = "Set Log Point" })
      )
    end,
  },
}
-- return {
--   "Weissle/persistent-breakpoints.nvim",
--   event = "VeryLazy",
--   ft = { "cpp, c", "cxx", "h", "hpp" },
--   config = function()
--     require("persistent-breakpoints").setup({
--       load_breakpoints_event = { "BufReadPost" },
--     })
--     local opts = { noremap = true, silent = true }
--     local keymap = vim.api.nvim_set_keymap
--     -- Save breakpoints to file automatically.
--     -- keymap(
--     --   "n",
--     --   "<leader>ad",
--     --   "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
--     --   vim.tbl_extend("force", opts, { desc = "Toggle breakpoint on/off" })
--     -- )
--     -- keymap(
--     --   "n",
--     --   "<leader>ac",
--     --   "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
--     --   vim.tbl_extend("force", opts, { desc = "Set Conditional breakpoint" })
--     -- )
--     -- keymap("n", "<leader>aL", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)
--     -- keymap(
--     --   "n",
--     --   "<leader>av",
--     --   "<cmd>lua require('persistent-breakpoints.api').set_log_point()<cr>",
--     --   vim.tbl_extend("force", opts, { desc = "Set Log Point" })
--     -- )
--   end,
-- }
-- {
--   "rcarriga/nvim-dap-ui",
--   dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
--   config = function()
--     local dap, dapui = require("dap"), require("dapui")
--     dapui.setup({ ---@type dapui.Config
--       controls = {
--         enabled = true,
--       },
--       element_mappings = {},
--       expand_lines = true,
--       floating = {
--         border = "single",
--         mappings = {
--           close = { "q", "<Esc>" },
--         },
--       },
--       force_buffers = true,
--       icons = {
--         collapsed = "󰞔",
--         current_frame = "",
--         expanded = "󰞒",
--       },
--       layouts = {
--         {
--           elements = {
--             {
--               id = "watches",
--               size = 0.25,
--             },
--             {
--               id = "stacks",
--               size = 0.25,
--             },
--             {
--               id = "scopes",
--               size = 0.50,
--             },
--           },
--           position = "left",
--           size = 0.25,
--         },
--         {
--           elements = {
--             {
--               id = "console",
--               size = 0.4,
--             },
--             {
--               id = "repl",
--               size = 0.6,
--             },
--           },
--           position = "bottom",
--           size = 0.25,
--         },
--       },
--       mappings = {
--         edit = "e",
--         expand = { "<CR>", "<2-LeftMouse>" },
--         open = "o",
--         remove = "d",
--         repl = "r",
--         toggle = "t",
--       },
--       render = {
--         indent = 1,
--         max_value_lines = 100,
--       },
--     })
--     dap.listeners.before.attach.dapui_config = function()
--       dapui.open()
--     end
--     dap.listeners.before.launch.dapui_config = function()
--       dapui.open()
--     end
--     dap.listeners.before.event_terminated.dapui_config = function()
--       dapui.close()
--     end
--     dap.listeners.before.event_exited.dapui_config = function()
--       dapui.close()
--     end
--   end,
-- },
