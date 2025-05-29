-- require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "vtsls" }
vim.lsp.enable(servers)
