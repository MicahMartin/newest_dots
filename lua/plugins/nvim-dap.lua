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
}
