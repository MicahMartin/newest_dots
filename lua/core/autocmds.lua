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

vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre", "BufReadPost", "BufNewFile" }, {
  group = "lint",
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "BufNewFile" }, {
  group = "lint",
  pattern = "*",
  callback = function()
    require("lint").try_lint()
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpAccept",
  callback = function(ev)
    local item = ev.data.item
    if item.kind == require("blink.cmp.types").CompletionItemKind.Function then
      vim.defer_fn(function()
        require("blink.cmp").show_signature()
      end, 10)
    end
    if item.kind == require("blink.cmp.types").CompletionItemKind.Snippet then
      vim.defer_fn(function()
        require("blink.cmp").show()
      end, 10)
    end
  end,
})
