M = {
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{ "catgoose/nvim-colorizer.lua", event = "BufReadPre", opts = {} },
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
	{ "neovim/nvim-lspconfig", lazy = false },
}

return M
