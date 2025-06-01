local M = { "stevearc/conform.nvim" }

M.event = { "BufWritePre" }
M.cmd = { "ConformInfo" }
M.keys = {
	{
		"<leader>a",
		function()
			vim.notify("formatting")
			require("conform").format({ async = true })
		end,
		mode = "",
		desc = "Format buffer",
	},
}

function M.config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			cpp = { "clang-format" },
			python = { "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})
end

return M
