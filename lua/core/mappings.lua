local opts = { noremap = true, silent = true }

-- Unbind Ctrl+g since we use that for terminal
vim.keymap.set("n", "<C-g>", "<Nop>", { noremap = true, silent = true })

-- Unbind in visual mode too
vim.keymap.set("v", "<C-g>", "<Nop>", { noremap = true, silent = true })

-- Window nav
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })

-- General controls
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
vim.keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

-- nvim tree
-- vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle<CR>", { desc = "nvimtree toggle window" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
--

-- visual selection stuff
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
-- Dont deselect after indenting
-- vim.keymap.set("v", "<", "<gv", opts)
-- vim.keymap.set("v", ">", ">gv", opts)

-- LEADER COMMANDS
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- format without prettier using the built in
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- prevent x delete from registering when next paste
vim.keymap.set("n", "x", '"_x', opts)

-- Replace the word cursor is on globally
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
--     { desc = "Replace word cursor is on globally" })

-- Executes shell command from in here making file executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

-- tab stuff
-- vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")   --open new tab
-- vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") --close current tab
-- vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")     --go to next
-- vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")     --go to pre
-- vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") --open current tab in new tab

--split management
-- vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- -- split window vertically
-- vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- -- split window horizontally
-- vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- -- close current split window
-- vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
	vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
	print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
-- local isLspDiagnosticsVisible = true
-- vim.keymap.set("n", "<leader>lx", function()
-- 	isLspDiagnosticsVisible = not isLspDiagnosticsVisible
-- 	vim.diagnostic.config({
-- 		virtual_text = isLspDiagnosticsVisible,
-- 		underline = isLspDiagnosticsVisible,
-- 	})
-- end, { desc = "Toggle LSP diagnostics" })
