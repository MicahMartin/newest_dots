local Plugin = { "folke/snacks.nvim" }
local user = {}

Plugin.lazy = false
Plugin.priority = 1000

Plugin.opts = {
	indent = user.indentConf,
	input = user.inputConf,
	explorer = user.explorerConf,
	picker = user.pickerConf,
	notifier = { enabled = true },
	statuscolumn = { enabled = true },
}

function Plugin.init()
	vim.g.snacks_animate = false
	vim.api.nvim_create_autocmd("User", {
		pattern = "VeryLazy",
		callback = user.setKeys,
	})
end

Plugin.keys = {
	{
		"t",
		desc = "File Explorer",
		function()
			local explorer_pickers = Snacks.picker.get({ source = "explorer" })
			if #explorer_pickers == 0 then
				Snacks.picker.explorer()
			elseif explorer_pickers[1]:is_focused() then
				explorer_pickers[1]:close()
			else
				explorer_pickers[1]:focus()
			end
		end,
	},
	{
		"<C-t>",
		function()
			Snacks.picker.jumps()
		end,
		desc = "Recent Jumps",
	},
	{
		"<C-f>",
		function()
			Snacks.picker.grep()
		end,
		desc = "Grep for words",
	},
	{
		"<C-e>",
		function()
			Snacks.picker.recent()
		end,
		desc = "Recent Files",
	},
	{
		"<C-g>",
		function()
			Snacks.lazygit()
		end,
		desc = "Launch Lazygit",
	},
	{
		"<leader>gl",
		function()
			Snacks.lazygit.log()
		end,
		desc = "Git Log",
	},
	{
		"<leader>?",
		function()
			Snacks.picker.keymaps()
		end,
		desc = "Show hotkeys",
	},
	{
		"<C-d>",
		function()
			Snacks.picker.smart()
		end,
		desc = "Smart Find Files",
	},
	{
		"<leader>x",
		function()
			Snacks.bufdelete()
		end,
		desc = "Delete Buffer",
	},
	{
		"<leader>X",
		function()
			Snacks.bufdelete.all()
		end,
		desc = "Delete all Buffers",
	},
	{
		"<leader>n",
		function()
			Snacks.notifier.show_history()
		end,
		desc = "Notification History",
	},
	{
		"<leader>s",
		function()
			Snacks.picker.lsp_symbols({
				tree = true,
				filter = {
					default = true,
					markdown = true,
					help = true,
				},
			})
		end,
		desc = "LSP Symbols",
	},
	{
		"<leader>S",
		function()
			Snacks.picker.lsp_workspace_symbols()
		end,
		desc = "LSP Workspace Symbols",
	},
	{
		"gd",
		function()
			Snacks.picker.lsp_definitions()
		end,
		desc = "Goto Definition",
	},
	{
		"gD",
		function()
			Snacks.picker.lsp_declarations()
		end,
		desc = "Goto Declaration",
	},
	{
		"gr",
		function()
			Snacks.picker.lsp_references()
		end,
		nowait = true,
		desc = "References",
	},
	{
		"gI",
		function()
			Snacks.picker.lsp_implementations()
		end,
		desc = "Goto Implementation",
	},
	{
		"gy",
		function()
			Snacks.picker.lsp_type_definitions()
		end,
		desc = "Goto T[y]pe Definition",
	},
	{
		"<leader>q",
		function()
			Snacks.picker.qflist()
		end,
		desc = "Quickfix List",
	},
	{
		"<leader>Q",
		function()
			Snacks.picker.qflist()
		end,
		desc = "Locationfix List",
	},
	{
		"<leader>d",
		function()
			Snacks.picker.diagnostics_buffer()
		end,
		desc = "Diagnostics",
	},
	{
		"<leader>D",
		function()
			Snacks.picker.diagnostics()
		end,
		desc = "Buffer Diagnostics",
	},
	{
		"<leader>/",
		function()
			Snacks.picker.grep_word()
		end,
		desc = "Visual selection or word",
		mode = { "n", "x" },
	},
}

function user.setKeys()
	_G.dd = function(...)
		Snacks.debug.inspect(...)
	end
	_G.bt = function()
		Snacks.debug.backtrace()
	end
	vim.print = _G.dd

	Snacks.toggle.line_number():map("<leader>ul")
	Snacks.toggle.inlay_hints():map("<leader>uh")
end

user.inputConf = {
	enabled = true,
	icon = "❯",
}

user.indentConf = {
	enabled = true,
	char = "▏",
	scope = { enabled = false },
	-- only_scope = true,
	chunk = { enabled = true, char = { vertial = "▏" } },
}

user.explorerConf = {
	enabled = true,
	replace_netrw = true,
}

user.teleLayout = {
	reverse = true, -- set to false for search bar to be on top
	layout = {
		box = "horizontal",
		backdrop = false,
		width = 0.8,
		height = 0.9,
		border = "none",
		{
			box = "vertical",
			{ win = "list", title = " Results ", title_pos = "center", border = "none" },
			{
				win = "input",
				height = 1,
				border = "none",
				title = "{title} {live} {flags}",
				title_pos = "center",
			},
		},
		{
			win = "preview",
			title = "{preview:Preview}",
			width = 0.50,
			border = "none",
			title_pos = "center",
		},
	},
}

user.pickerConf = {
	enabled = true,
	matchers = { frecency = true, cwd_bonus = false },
	formatters = {
		file = {
			filename_first = false,
			filename_only = false,
			icon_width = 2,
		},
	},
	layout = {
		-- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
		preset = "telescope", -- defaults to this layout unless overidden
		cycle = false,
	},

	layouts = {
		select = {
			preview = false,
			layout = {
				backdrop = false,
				width = 0.6,
				min_width = 80,
				height = 0.4,
				min_height = 10,
				box = "vertical",
				border = "none",
				title = "{title}",
				title_pos = "center",
				{ win = "input", height = 1, border = "bottom" },
				{ win = "list", border = "none" },
				{ win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
			},
		},
		telescope = {
			reverse = false, -- set to false for search bar to be on top
			layout = {
				box = "horizontal",
				backdrop = false,
				width = 0.8,
				height = 0.9,
				border = "none",
				{
					box = "vertical",
					{
						win = "input",
						height = 1,
						border = "none",
						title = "{title} {live} {flags}",
						title_pos = "center",
					},
					{ win = "list", title = " Results ", title_pos = "center", border = "none" },
				},
				{
					win = "preview",
					title = "{preview:Preview}",
					width = 0.50,
					border = "none",
					title_pos = "center",
				},
			},
		},
		ivy = {
			layout = {
				box = "vertical",
				backdrop = false,
				width = 0,
				height = 0.4,
				position = "bottom",
				border = "top",
				title = " {title} {live} {flags}",
				title_pos = "left",
				{ win = "input", height = 1, border = "bottom" },
				{
					box = "horizontal",
					{ win = "list", border = "none" },
					{ win = "preview", title = "{preview}", width = 0.5, border = "left" },
				},
			},
		},
	},
}

-- return {}
return Plugin
