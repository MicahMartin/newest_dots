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

vim.keymap.set("n", "<leader>wu", "<cmd>vertical resize +6 <cr>", { desc = "Quick horizontal increase" })
vim.keymap.set("n", "<leader>wU", "<cmd>vertical resize -6 <cr>", { desc = "Quick horizontal decrease " })
vim.keymap.set("n", "<leader>wd", "<cmd> resize +6 <cr>", { desc = "Quick vert increase" })
vim.keymap.set("n", "<leader>wD", "<cmd> resize -6 <cr>", { desc = "Quick vert decrease" })

vim.keymap.set("n", "t", "'", { desc = "Remap of mark jump prefix" })

-- General controls
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
-- Resizes
vim.api.nvim_create_user_command("Vr", function()
	local usage = "Usage: :Vr {number (1–100)}"

	vim.ui.input({ prompt = "Vertical resize (%): " }, function(input)
		-- If the user canceled or submitted an empty string, show usage and return
		if not input or input == "" then
			vim.notify(usage, vim.log.levels.WARN)
			return
		end

		local pct = tonumber(input)
		if not pct then
			vim.notify("Not a valid number: " .. input, vim.log.levels.ERROR)
			return
		end

		if pct <= 0 or pct > 100 then
			vim.notify("Percentage must be between 1 and 100", vim.log.levels.ERROR)
			return
		end

		-- Compute new width as total columns * (pct / 100)
		local total_cols = vim.opt.columns:get()
		local new_width = math.floor(total_cols * (pct / 100.0))
		vim.notify_once("new width: " .. new_width)

		vim.cmd("vertical resize " .. new_width)
	end)
end, { nargs = "?" })

vim.api.nvim_create_user_command("Hr", function()
	local usage = "Usage: :Hr {number (1–100)}"

	vim.ui.input({ prompt = "horizontal resize (%): " }, function(input)
		-- If the user canceled or submitted an empty string, show usage and return
		if not input or input == "" then
			vim.notify(usage, vim.log.levels.WARN)
			return
		end

		local pct = tonumber(input)
		if not pct then
			vim.notify("Not a valid number: " .. input, vim.log.levels.ERROR)
			return
		end

		if pct <= 0 or pct > 100 then
			vim.notify("Percentage must be between 1 and 100", vim.log.levels.ERROR)
			return
		end

		-- Compute new height as total rows * (pct / 100)
		local total_rows = vim.opt.lines:get() - vim.opt.cmdheight:get()
		local new_height = math.floor(total_rows * (pct / 100.0))
		vim.notify_once("new height: " .. new_height)

		vim.cmd("resize " .. new_height)
	end)
end, { nargs = "?" })

vim.keymap.set("n", "<leader>w.", "<cmd>Hr<cr>", { desc = "Resize horizontal percent" })
vim.keymap.set("n", "<leader>w,", "<cmd>Vr<cr>", { desc = "Resize vert percent" })
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
			overseer.open({ enter = true })
		end
	end)
end, { desc = "Overseer commands" })
