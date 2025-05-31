local Plugin = { "folke/noice.nvim" }

Plugin.event = "VeryLazy"
Plugin.dependencies = { "MunifTanjim/nui.nvim" }

Plugin.opts = {
	lsp = {
		progress = { enabled = false }, -- using snacks
		hover = { enabled = false }, --using blink.cmp
		signature = { enabled = false }, -- using blink.cmp
	},
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		-- lsp_doc_border = true,        -- add a border to hover docs and signature help
	},
	routes = {
		{
			view = "notify",
			filter = { event = "msg_showmode" },
		},
	},
}

-- return {}
return Plugin
