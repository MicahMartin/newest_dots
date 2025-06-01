local M = { "williamboman/mason.nvim" }

M.lazy = false

M.dependencies = {
	{ "nvim-lspconfig", lazy = false },
	{ "williamboman/mason-lspconfig.nvim" },
}

function M.config()
	-- require("nvim-lspconfig").setup()
	require("mason").setup({})
	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "vtsls", "bashls" },
	})
end

-- return M
return {}
