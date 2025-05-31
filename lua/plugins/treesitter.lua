local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.branch = "main"
Plugin.build = ":TSUpdate"
Plugin.lazy = false
Plugin.priority = 1000

function ensure_installed(parsers, installedParsers)
	local missing = {}

	for _, parser in ipairs(parsers) do
		local installed = vim.tbl_contains(installedParsers, parser)

		if not installed then
			table.insert(missing, parser)
		end
	end
	return missing
end

function Plugin.config()
	local treesitter = require("nvim-treesitter")
	-- Parsers that should be on the system
	local parsers =
		{ "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc" }
	-- enabled filetypes for treesitter
	local filetypes = { "lua", "vim", "help", "cpp", "javascript", "c", "python", "go", "sh", "query" }

	-- check if we're missing any of the mando parsers
	local missing = ensure_installed(parsers, treesitter.get_installed())
	if not vim.tbl_isempty(missing) then
		treesitter.install(missing)
	end

	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetypes,
		desc = "enable treesitter syntax highlight",
		callback = function()
			vim.treesitter.start()
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.notify_once("treesitter good!")
		end,
	})

	treesitter.setup({})
end

return Plugin
