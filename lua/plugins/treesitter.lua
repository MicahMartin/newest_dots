return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = function()
		local parser_installed = {
			"c",
			"cpp",
			"diff",
			"dockerfile",
			"go",
			"gomod",
			"gosum",
			"html",
			"css",
			"javascript",
			"typescript",
			"lua",
			"markdown",
			"markdown_inline",
			"comment",
			"python",
			"rust",
			"sql",
			"tsx",
			"yaml",
			"bash",
			"http",
			"xml",
			"jq",
			"json",
			"printf",
			"vim",
			"vimdoc",
			"query",
			"cmake",
			"dot",
			"graphql",
			"ini",
			"toml",
			"jsdoc",
			"luadoc",
			"make",
			"regex",
		}
		vim.notify_once("installing parsers")
		require("nvim-treesitter").install(parser_installed)
		require("nvim-treesitter").update()
	end,

	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local filetype = args.match
				local lang = vim.treesitter.language.get_lang(filetype)
				if vim.treesitter.language.add(lang) then
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					vim.treesitter.start()
				end
			end,
		})
	end,
}
