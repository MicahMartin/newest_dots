local M = { "folke/snacks.nvim" }
local user = {}

M.lazy = false
M.priority = 1000

function user.setKeys()
	_G.dd = function(...)
		Snacks.debug.inspect(...)
	end
	_G.bt = function()
		Snacks.debug.backtrace()
	end
	vim.print = _G.dd

	Snacks.toggle.line_number():map("<leader>ul")
	Snacks.toggle.inlay_hints():map("<leader>uh")
end

M.opts = {
	indent = {
		enabled = true,
		char = "▏",
		scope = { enabled = false },
		chunk = { enabled = true, char = { vertial = "▏" } },
	},
	input = { enabled = true, icon = "❯" },
	explorer = {
		enabled = true,
		replace_netrw = true,
	},
	picker = { enabled = true },
	notifier = { enabled = true },
	statuscolumn = { enabled = true },
}

function M.init()
	vim.g.snacks_animate = false
	vim.api.nvim_create_autocmd("User", {
		pattern = "VeryLazy",
		callback = user.setKeys,
	})
end

M.keys = {
	{
		"t",
		desc = "File Explorer",
		function()
			local explorer_pickers = Snacks.picker.get({ source = "explorer" })
			if #explorer_pickers == 0 then
				Snacks.picker.explorer()
			elseif explorer_pickers[1]:is_focused() then
				explorer_pickers[1]:close()
			else
				explorer_pickers[1]:focus()
			end
		end,
	},
	{
		"<C-t>",
		function()
			Snacks.picker.jumps()
		end,
		desc = "Recent Jumps",
	},
	{
		"<C-f>",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep for words",
	},
	{
		"<C-e>",
		function()
			Snacks.picker.recent()
		end,
		desc = "Recent Files",
	},
	{
		"<C-g>",
		function()
			Snacks.lazygit()
		end,
		desc = "Launch Lazygit",
	},
	{
		"<leader>gl",
		function()
			Snacks.lazygit.log()
		end,
		desc = "Git Log",
	},
	{
		"<leader>?",
		function()
			Snacks.picker.keymaps()
		end,
		desc = "Show hotkeys",
	},
	{
		"<C-d>",
		function()
			Snacks.picker.smart()
		end,
		desc = "Smart Find Files",
	},
	{
		"<leader>x",
		function()
			Snacks.bufdelete()
		end,
		desc = "Delete Buffer",
	},
	{
		"<leader>X",
		function()
			Snacks.bufdelete.all()
		end,
		desc = "Delete all Buffers",
	},
	{
		"<leader>n",
		function()
			Snacks.notifier.show_history()
		end,
		desc = "Notification History",
	},
	{
		"<leader>s",
		function()
			Snacks.picker.lsp_symbols({
				tree = true,
				filter = {
					default = true,
					markdown = true,
					help = true,
				},
			})
		end,
		desc = "LSP Symbols",
	},
	{
		"<leader>S",
		function()
			Snacks.picker.lsp_workspace_symbols()
		end,
		desc = "LSP Workspace Symbols",
	},
	{
		"gd",
		function()
			Snacks.picker.lsp_definitions()
		end,
		desc = "Goto Definition",
	},
	{
		"gD",
		function()
			Snacks.picker.lsp_declarations()
		end,
		desc = "Goto Declaration",
	},
	{
		"gr",
		function()
			Snacks.picker.lsp_references()
		end,
		nowait = true,
		desc = "References",
	},
	{
		"gI",
		function()
			Snacks.picker.lsp_implementations()
		end,
		desc = "Goto Implementation",
	},
	{
		"gy",
		function()
			Snacks.picker.lsp_type_definitions()
		end,
		desc = "Goto T[y]pe Definition",
	},
	{
		"<leader>q",
		function()
			Snacks.picker.qflist()
		end,
		desc = "Quickfix List",
	},
	{
		"<leader>Q",
		function()
			Snacks.picker.qflist()
		end,
		desc = "Locationfix List",
	},
	{
		"<leader>d",
		function()
			Snacks.picker.diagnostics_buffer()
		end,
		desc = "Diagnostics",
	},
	{
		"<leader>D",
		function()
			Snacks.picker.diagnostics()
		end,
		desc = "Buffer Diagnostics",
	},
	{
		"<leader>/",
		function()
			Snacks.picker.grep_word()
		end,
		desc = "Visual selection or word",
		mode = { "n", "x" },
	},
}

return M
