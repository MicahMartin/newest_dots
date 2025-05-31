local Plugin = { "mason-org/mason-lspconfig.nvim" }

Plugin.lazy = false

Plugin.dependencies = {
  "neovim/nvim-lspconfig",
  { "mason-org/mason.nvim", opts = {} },
}

Plugin.opts = {
  ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
}

return Plugin
