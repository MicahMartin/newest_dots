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

-- function M.find_symbol_node(symbols, queryName, cursor_pos)
--   for _, sym in ipairs(symbols) do
--     local r = sym.range or sym.selectionRange
--     local start_line, end_line = r.start.line, r["end"].line
--     -- check if cursor is in that symbol's range and name matches
--     if sym.name == queryName and cursor_pos[1] - 1 >= start_line and cursor_pos[1] - 1 <= end_line then
--       return sym
--     end
--     -- else, search children
--     if sym.children then
--       local found = M.find_symbol_node(sym.children, queryName, cursor_pos)
--       if found then
--         return found
--       end
--     end
--   end
--   return nil
-- end
--
-- -- 4C) Main command: Extract the class’s members and show them in a scratch buffer
-- vim.keymap.set("n", "<leader>cS", function()
--   local cursor = vim.api.nvim_win_get_cursor(0) -- {line, col}
--   local word = vim.fn.expand("<cword>") -- e.g. “CapsuleShape”
--   M.get_document_symbols(function(symbols)
--     local root = M.find_symbol_node(symbols, word, cursor)
--     if not root then
--       vim.notify("Couldn’t find symbol “" .. word .. "” in this file", vim.log.levels.INFO)
--       return
--     end
--
--     -- Collect all children names (methods, fields, nested types)
--     local lines = {}
--     table.insert(lines, "Members of “" .. word .. "” (“" .. root.kind .. "”):")
--     local function walk(sym, indent)
--       for _, child in ipairs(sym.children or {}) do
--         local prefix = string.rep("  ", indent)
--         local line = prefix .. "- [" .. child.kind .. "] " .. child.name
--         table.insert(lines, line)
--         walk(child, indent + 1)
--       end
--     end
--     walk(root, 1)
--
--     -- Open a new scratch buffer and populate it
--     local buf = vim.api.nvim_create_buf(false, true) -- listed=false, scratch=true
--     vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
--     vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
--     vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
--     -- open it in a vertical split
--     vim.api.nvim_command("vsplit")
--     vim.api.nvim_set_current_buf(buf)
--     vim.api.nvim_buf_set_option(buf, "modifiable", false)
--   end)
-- end, { silent = true, desc = "Show class members in scratch buffer" })

-- just for reference im too lazy to get extension for filenames
-- local function get_references_sync()
--   local references = {}
--   local is_done = false
--   local params = vim.lsp.util.make_position_params()
--
--   -- Send the request to all LSP servers
--   vim.lsp.buf_request_all(0, "textDocument/references", params, function(response)
--     -- Process responses from all servers
--     for client_id, result in pairs(response) do
--       _ = client_id
--       if result.result then
--         for _, ref in ipairs(result.result) do
--           table.insert(references, ref)
--         end
--       end
--     end
--     is_done = true
--   end)
--
--   -- Wait for results with timeout
--   local ok = vim.wait(5000, function()
--     return is_done
--   end, 100)
--
--   if not ok then
--     vim.notify("LSP references request timed out", vim.log.levels.WARN)
--     return nil
--   end
--
--   return references
-- end
--
-- ---@type snacks.picker.finder
-- local function lsp_references_finder(opts)
--   _ = opts
--
--   local references = get_references_sync()
--   if references == nil then
--     return {}
--   end
--
--   ---@type snacks.picker.finder.Item[]
--   local items = {}
--
--   local files = {}
--   local dirs = {}
--
--   for _, ref in ipairs(references) do
--     local uri = ref.uri or ref.targetUri
--     local filename = vim.uri_to_fname(uri)
--     local dirname = vim.fs.dirname(filename)
--     local line = ref.range.start.line + 1
--     local col = ref.range.start.character + 1
--     local ref_item = {
--       type = "ref",
--       filename = filename,
--       dirname = dirname,
--
--       file = filename,
--       pos = { line, col },
--       ref = ref,
--
--       dir_score = 1,
--       file_score = 1,
--       ref_score = ref.range.start.line,
--     }
--     table.insert(items, ref_item)
--
--     local file_item = files[filename]
--       or {
--         type = "file",
--         filename = filename,
--         dirname = dirname,
--         children = {},
--
--         file = filename,
--
--         dir_score = 1,
--         file_score = 0,
--       }
--     ref_item.parent = file_item
--     table.insert(file_item.children, ref_item)
--
--     local dir_item = dirs[dirname]
--       or {
--         type = "dir",
--         filename = filename,
--         dirname = dirname,
--         children = {},
--
--         file = dirname,
--         dir = true,
--         open = true,
--
--         dir_score = 0,
--         file_score = 0,
--       }
--     file_item.parent = dir_item
--     table.insert(dir_item.children, file_item)
--
--     files[filename] = file_item
--     dirs[dirname] = dir_item
--   end
--
--   for _, f in pairs(files) do
--     f.children[#f.children].last = true
--     table.insert(items, f)
--   end
--
--   for _, d in pairs(dirs) do
--     d.children[#d.children].last = true
--     table.insert(items, d)
--   end
--
--   return items
-- end
--
-- -- This function queries LSP for references at the current cursor position,
-- -- groups the results by filename, and then opens a snacks.nvim picker in tree mode.
-- function M.references()
--   require("snacks").picker({
--     title = "LSP References by File",
--     tree = true,
--     finder = lsp_references_finder,
--     sort = {
--       fields = {
--         "dirname",
--         "dir_score",
--         "file",
--         "file_score",
--         "ref_score",
--       },
--     },
--     matcher = { sort_empty = true },
--     format = require("snacks.picker.format").file,
--   })
-- end

return M
