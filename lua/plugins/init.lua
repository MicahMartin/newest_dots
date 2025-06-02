-- {
-- 	"mfussenegger/nvim-dap",
-- 	lazy = false,
-- 	dependencies = {
-- 		{
-- 			"rcarriga/nvim-dap-ui",
-- 			dependencies = {
-- 				"nvim-neotest/nvim-nio",
-- 			},
-- 		},
-- 		"theHamsta/nvim-dap-virtual-text",
-- 	},
-- 	config = function()
-- 		require("dapui").setup()
-- 	end,
-- },
M = {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		-- Copied from LazyVim/lua/lazyvim/plugins/extras/dap/core.lua and
		-- modified.
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},

			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},

			{
				"<leader>dC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to Cursor",
			},

			{
				"<leader>dT",
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
			-- ensure_installed = {
			-- 	"bash",
			-- 	"codelldb",
			-- 	"php",
			-- 	"python",
			-- },
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
	{
		"rcarriga/nvim-dap-ui",
		config = true,
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "Dap UI",
			},
		},
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			-- "leoluz/nvim-dap-go",
			-- "mfussenegger/nvim-dap-python",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
	},
	{ "stevearc/overseer.nvim", opts = {} },
	{ "catgoose/nvim-colorizer.lua", event = "BufReadPre", opts = {} },
	{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
	{ "neovim/nvim-lspconfig", lazy = false },
	{ "jay-babu/mason-nvim-dap.nvim" },
}

return M
