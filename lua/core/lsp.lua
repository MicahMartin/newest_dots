vim.lsp.enable({ "clangd", "lua_ls", "vtsls", "gopls", "tailwindcss", "marksman" })
vim.lsp.config("*", {
  on_init = function()
    vim.notify("global LSP init")
  end,
})
