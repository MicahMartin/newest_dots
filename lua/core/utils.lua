local M = {}
function M.prompt_resize(kind) -- @param kind  string: "vertical" or "horizontal"
  local usage, prompt, total_dim, cmd
  if kind == "vertical" then
    usage = "Usage: :Vr {number (1–100)}"
    prompt = "Vertical resize (%): "
    total_dim = vim.opt.columns:get()
    cmd = "vertical resize"
  else
    usage = "Usage: :Hr {number (1–100)}"
    prompt = "Horizontal resize (%): "
    -- subtract cmdheight so the command‐line itself isn’t counted
    total_dim = vim.opt.lines:get() - vim.opt.cmdheight:get()
    cmd = "resize"
  end

  vim.ui.input({ prompt = prompt }, function(input)
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

    local new_size = math.floor(total_dim * (pct / 100.0))
    vim.notify_once(("new %s: %d"):format(kind == "vertical" and "width" or "height", new_size))
    vim.cmd(("%s %d"):format(cmd, new_size))
  end)
end

-- just for reference im too lazy to get extension for filenames
M.files_to_format = {
  "lua",
  "c",
  "cpp",
  "h",
  "python",
  "rust",
  "javascript",
  "typescript",
  "html",
  "json",
  "yaml",
  "markdown",
  "graphql",
}

return M
