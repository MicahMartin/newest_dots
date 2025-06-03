local M = { "saghen/blink.cmp" }

M.version = "1.*"
M.lazy = false

function M.config()
	require("blink.cmp").setup({
		appearance = {
			use_nvim_cmp_as_default = true,
		},
		fuzzy = { implementation = "rust" },
		keymap = {
			preset = "enter",
			["<C-k>"] = { "select_prev", "fallback_to_mappings" },
			["<C-j>"] = { "select_next", "fallback_to_mappings" },

			["<C-p>"] = { "scroll_documentation_up", "fallback" },
			["<C-n>"] = { "scroll_documentation_down", "fallback" },
		},
		signature = { enabled = true, window = { show_documentation = false } },
		completion = {
			ghost_text = { enabled = true },
			menu = {
				scrollbar = false,
				scrolloff = 1,
				draw = {
					components = {},
					treesitter = { "lsp" },
				},
			},
			list = { selection = { auto_insert = false } },
			documentation = { auto_show = true, window = { scrollbar = false } },
		},
	})
end

return M
