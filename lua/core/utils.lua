local M = {}

function M.prompt_resize(kind) -- @param kind  string: "vertical" or "horizontal"
  local usage, prompt, total_dim, cmd
  if kind == "vertical" then
    usage = "Usage: :Vr {number (1–100)}"
    prompt = "Vertical resize (%): "
    cmd = "vertical resize"
    total_dim = vim.opt.lines:get() - vim.opt.cmdheight:get()
  else
    usage = "Usage: :Hr {number (1–100)}"
    prompt = "Horizontal resize (%): "
    cmd = "resize"
    total_dim = vim.opt.columns:get()
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

M.cb = function(err, res, context, conf)
  if err then
    vim.notify_once("sigh, an error " .. err.message)
    dd(res)
    dd(context)
    dd(conf)
  end
  vim.notify_once("not an error! ")
  dd(res)
  dd(context)
  dd(conf)
end

function M.doRequest(args)
  local client = assert(vim.lsp.get_clients()[0])
end
return M
