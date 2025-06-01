-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
-- vim.api.nvim_create_autocmd("RecordingEnter", {
-- 	callback = function()
-- 		local register = vim.fn.reg_recording()
-- 		if register ~= "" then
-- 			notify_macro_start(register)
-- 		end
-- 	end,
-- 	desc = "Notify macro start",
-- })

-- Notification on macro end
vim.api.nvim_create_autocmd("RecordingLeave", {
	callback = function()
		local register = vim.fn.reg_recording()
		if register ~= "" then
			vim.notify("Macro done recording")
		end
	end,
	desc = "Notify macro end",
})

-- sync with system clipboard on focus
-- vim.api.nvim_create_autocmd({ "FocusGained" }, {
-- 	pattern = { "*" },
-- 	command = [[call setreg("@", getreg("+"))]],
-- })
--
-- -- sync with system clipboard on focus
-- vim.api.nvim_create_autocmd({ "FocusLost" }, {
-- 	pattern = { "*" },
-- 	command = [[call setreg("+", getreg("@"))]],
-- })
