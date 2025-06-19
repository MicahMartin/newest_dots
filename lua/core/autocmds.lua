vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  desc = "Notify macro end",
  callback = function()
    local register = vim.fn.reg_recording()
    if register ~= "" then
      vim.notify("Macro done recording")
    end
  end,
})

vim.api.nvim_create_augroup("format", { clear = true })
vim.api.nvim_create_augroup("dap", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "format",
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
