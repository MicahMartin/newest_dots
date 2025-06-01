local Plugin = { "williamboman/mason.nvim" }

Plugin.lazy = false

Plugin.dependencies = {
	{ "nvim-lspconfig", lazy = false },
	{ "williamboman/mason-lspconfig.nvim" },
}

function Plugin.config()
	-- require("nvim-lspconfig").setup()
	require("mason").setup({})
	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "vtsls", "bashls" },
	})
end

return Plugin
