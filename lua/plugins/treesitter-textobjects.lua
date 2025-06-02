local M = { "nvim-treesitter/nvim-treesitter-textobjects" }

M.branch = "main"
M.lazy = false

function M.config()
	local ts_select_mod = require("nvim-treesitter-textobjects.select")

	local keymap = function(lhs, ts_capture)
		vim.keymap.set({ "x", "o" }, lhs, function()
			ts_select_mod.select_textobject(ts_capture, "textobjects")
		end)
	end

	keymap("af", "@function.outer")
	keymap("if", "@function.inner")
	keymap("ac", "@class.outer")
	keymap("ic", "@class.inner")

	vim.keymap.set("i", "<C-L>", function()
		local node = vim.treesitter.get_node()
		if node ~= nil then
			local row, col = node:end_()
			pcall(vim.api.nvim_win_set_cursor, 0, { row + 1, col })
		end
	end, { desc = "insjump" })
end

return M
