return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    ft = { "cpp, c", "cxx", "h", "hpp" },
    dependencies = {},
    opts = {},
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
    opts = {},
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
    opts = {},
    config = function()
      require("persistent-breakpoints").setup({
        load_breakpoints_event = { "BufReadPost" },
      })
      local opts = { noremap = true, silent = true }
      local keymap = vim.api.nvim_set_keymap
      -- Save breakpoints to file automatically.
      keymap("n", "<F2>", "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", opts)
      keymap("n", "<C-F2>", "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>", opts)
      keymap("n", "<F3>", "<cmd>lua require('persistent-breakpoints.api').set_log_point()<cr>", opts)
      keymap("n", "<F4>", "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>", opts)
    end,
  },
}
