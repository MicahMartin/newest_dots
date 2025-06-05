-- { "neovim/nvim-lspconfig", lazy = false },
M = {
  { "github/copilot.vim", event = "BufReadPre" },
  { "catgoose/nvim-colorizer.lua", event = "BufReadPre", opts = {} },
  { "folke/which-key.nvim", event = "BufReadPre", opts = {} },
  { "rafamadriz/friendly-snippets", event = "BufReadPre" },
}

return M
