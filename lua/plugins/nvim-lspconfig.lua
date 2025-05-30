local Plugin = {'neovim/nvim-lspconfig'}
Plugin.servers = { "html", "cssls", "clangd", "vtsls" }

function Plugin.config()
  vim.lsp.enable(Plugin.servers)
end

return Plugin
