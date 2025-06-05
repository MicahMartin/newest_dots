require("core.options")
require("core.mappings")
require("core.autocmds")
require("core.lazy")

local def_capabilites = vim.lsp.protocol.make_client_capabilities()
vim.lsp.config("*", {
  capabiliteies = def_capabilites,
})
vim.lsp.enable({ "clangd", "lua_ls" })
