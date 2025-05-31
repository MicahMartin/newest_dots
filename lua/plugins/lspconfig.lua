local Plugin = {'mason-org/mason-lspconfig.nvim'}

Plugin.lazy = false

Plugin.dependencies = {
  { "mason-org/mason.nvim", opts = {} },
  "neovim/nvim-lspconfig",
}

Plugin.opts = {
  ensure_installed = { "lua_ls", "rust_analyzer", "clangd" }
}
return Plugin
