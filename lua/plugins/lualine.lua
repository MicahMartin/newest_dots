return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons", "rebelot/kanagawa.nvim" },
	config = function()
		local custom_kanagawa = require("lualine.themes.kanagawa")
		-- Change the background of lualine_c section for normal mode
		custom_kanagawa.normal.c.bg = "#1f1f28"

		require("lualine").setup({
			options = {
				theme = custom_kanagawa,
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "lsp_status", "hostname", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
