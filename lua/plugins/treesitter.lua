local M = { "nvim-treesitter/nvim-treesitter" }

M.branch = "main"
M.build = ":TSUpdate"
M.lazy = false
M.priority = 1000

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

function M.config()
	local treesitter = require("nvim-treesitter")
	-- Parsers that should be on the system
	local parsers = {
		"query",
		"lua",
		"luadoc",
		"vim",
		"vimdoc",
		"markdown",
		"markdown_inline",
		"c",
		-- "cpp",
		-- "javascript",
		-- "typescript",
		"python",
		-- "go",
		"bash",
		-- "diff",
		"html",
		"regex",
		-- "xml",
		-- "rust",
		-- "json",
		-- "java",
	}
	-- enabled filetypes for treesitter
	local filetypes = {
		"c",
		"cpp",
		"javascript",
		"typescript",
		"python",
		"go",
		"sh",
		"query",
		"markdown",
		"json",
		"xml",
		"lua",
		"vim",
		"help",
	}

	-- check if we're missing any of the mando parsers
	local missing = ensure_installed(parsers, treesitter.get_installed())
	if not vim.tbl_isempty(missing) then
		treesitter.install(missing)
	end

	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetypes,
		desc = "enable treesitter syntax highlight",
		callback = function()
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			vim.notify_once("treesitter good!")
			vim.treesitter.start()
		end,
	})

	treesitter.setup({})
end

return M

