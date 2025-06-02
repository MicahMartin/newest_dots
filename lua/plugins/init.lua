M = {
	{
		"mfussenegger/nvim-dap",
		lazy = false,
		dependencies = {
			{ "igorlfs/nvim-dap-view", opts = {} },
		},
		keys = {
			{
				"<leader>ab",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},

			{
				"<leader>ac",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},

			{
				"<leader>aC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to Cursor",
			},

			{
				"<leader>aT",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		---@type MasonNvimDapSettings
		opts = {
			-- This line is essential to making automatic installation work
			-- :exploding-brain
			handlers = {},
			--automatic_installation = {
			--	-- These will be configured by separate plugins.
			--	exclude = {
			--		"delve",
			--		"python",
			--	},
			--},
			-- DAP servers: Mason will be invoked to install these if necessary.
			ensure_installed = {
				"codelldb",
				--"python",
			},
		},
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = true,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{ "stevearc/overseer.nvim", opts = {} },
	{ "catgoose/nvim-colorizer.lua", event = "BufReadPre", opts = {} },
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
	{ "neovim/nvim-lspconfig", lazy = false },
	{ "jay-babu/mason-nvim-dap.nvim" },
}

return M
