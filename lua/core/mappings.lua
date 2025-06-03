local opts = { noremap = true, silent = true }

-- Unbind Ctrl+g since we use that for terminal
vim.keymap.set("n", "<C-g>", "<Nop>", { noremap = true, silent = true })

-- Unbind in visual mode too
vim.keymap.set("v", "<C-g>", "<Nop>", { noremap = true, silent = true })

-- unbind s and S, we need those for surround
vim.keymap.set("n", "s", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "S", "<Nop>", { noremap = true, silent = true })

-- Window nav
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })

vim.keymap.set("n", ",", "'", { desc = "Remap of mark jump prefix" })

-- General controls
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
--
-- Dont deselect after indenting
-- vim.keymap.set("v", "<", "<gv", opts)
-- vim.keymap.set("v", ">", ">gv", opts)

-- LEADER COMMANDS
-- Quit vim
vim.keymap.set("n", "<leader>X", ":qa<CR>", { noremap = true, silent = true })
-- close all buffers but not vim
vim.keymap.set("n", "<leader>x", ":%bd!<CR>", { noremap = true, silent = true })
-- window controls prefix
vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("n", "x", '"_x', opts)

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
	vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
	print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
-- Code action
vim.keymap.set("n", "<leader>k", function()
	vim.lsp.buf.code_action()
end, { desc = "{USER}Perform code action" })

-- local isLspDiagnosticsVisible = true
-- vim.keymap.set("n", "<leader>lx", function()
-- 	isLspDiagnosticsVisible = not isLspDiagnosticsVisible
-- 	vim.diagnostic.config({
-- 		virtual_text = isLspDiagnosticsVisible,
-- 		underline = isLspDiagnosticsVisible,
-- 	})
-- end, { desc = "Toggle LSP diagnostics" })
-- vim.keymap.set("n", "<leader>p", ":DapViewOpen<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>p", function()
	require("dapui").toggle()
end, { desc = "dap ui toggle" })

vim.keymap.set("n", "<leader>o", ":ObserverOpen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", function()
	local overseer = require("overseer")
	overseer.run_template({}, function(task)
		if task then
			overseer.open({ direction = "right", enter = false })
		end
	end)
end, { desc = "Overseer commands" })
