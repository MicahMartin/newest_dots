require "core.options"
require "core.mappings"
require "core.autocmds"

-- load lazy
vim.lsp.enable({
    "gopls",
    "lua_ls"
})

require "core.lazy"
