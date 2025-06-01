local Plugin = { "saghen/blink.cmp" }
local user = {}

Plugin.version = "1.*"
Plugin.dependencies = { "neovim/nvim-lspconfig" }

Plugin.opts = {
	fuzzy = { implementation = "prefer_rust_with_warning" },
	keymap = { preset = "enter" },
	signature = {
		enabled = true,
		window = {
			show_documentation = true,
			treesitter_highlighting = true,
		},
	},
	cmdline = { enabled = false },
	completion = {
		menu = {
			auto_show = true,
			draw = {
				padding = { 0, 1 }, -- padding only on right side
				treesitter = { "lsp" },
				components = {
					-- kind_icon = { text = user.textFn, highlight = user.highlightFn },
					kind = { highlight = user.highlightFn },
				},
				columns = {
					{ "label" },
					{ "kind_icon", "kind" },
				},
			},
		},
		keyword = { range = "full" },
		accept = { auto_brackets = { enabled = true } },
		list = { selection = { preselect = true, auto_insert = false } },
		documentation = { auto_show = true, auto_show_delay_ms = 300 },
		ghost_text = { enabled = true },
	},
	appearance = {
		nerd_font_variant = "normal",
	},
}

function user.enabledFn()
	return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
end

function user.textFn(ctx)
	local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
	return kind_icon
end

function user.highlightFn(ctx)
	local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
	return hl
end

function user.transformFn(_, items)
	return vim.tbl_filter(function(item)
		return item.kind ~= require("blink.cmp.types").CompletionItemKind.Keyword
	end, items)
end

user.o = {
	signature = { enabled = true },
	-- enabled = enabledFn,
	cmdline = { enabled = false },
	keymap = { preset = "enter" },
	appearance = {
		nerd_font_variant = "normal",
	},
	completion = {
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				components = {
					kind_icon = { text = textFn, highlight = highlightFn },
					kind = { highlight = highlightFn },
				},
				columns = {
					{ "kind_icon" },
					{ "label", "label_description", gap = 1 },
				},
			},
		},
		keyword = { range = "full" },
		accept = { auto_brackets = { enabled = true } },
		list = { selection = { preselect = false, auto_insert = true } },
		documentation = { auto_show = true, auto_show_delay_ms = 400 },
		ghost_text = { enabled = true },
	},
	sources = {
		default = { "lsp", "path", "snippets" },
		-- providers = {
		-- 	lsp = {
		-- 		name = "LSP",
		-- 		module = "blink.cmp.sources.lsp",
		-- 		transform_items = transformFn,
		-- 	},
		-- 	path = { opts = {
		-- 		get_cwd = function(_)
		-- 			return vim.fn.getcwd()
		-- 		end,
		-- 	} },
		-- },
	},
	fuzzy = { implementation = "prefer_rust" },
}

user.bDraw = {
	columns = {
		{ "label", "label_description", gap = 1 },
		{ "kind_icon", "kind" },
	},
}

user.cSignature = {
	enabled = true,
	window = {
		show_documentation = false,
		treesitter_highlighting = true,
		-- bwinhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
	},
}
user.cCompletion = {
	menu = { auto_show = true },
	ghost_text = { enabled = true },
	keyword = { range = "full" },
	-- accept = { auto_brackets = { enabled = true } },
	-- list = { selection = { preselect = false, auto_insert = true } },
	documentation = { auto_show = false },
}

-- return {}
return Plugin
