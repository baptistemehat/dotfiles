require("codecompanion").setup({
	log_level = "INFO", -- or "TRACE" or "DEBUG"
	display = {
		chat = {
			window = {
				layout = "vertical", -- float|vertical|horizontal|buffer
				position = "right", -- left|right|top|bottom (nil will default depending on vim.opt.plitright|vim.opt.splitbelow)
				border = "single",
				height = 0.8,
				width = 0.4,
				relative = "editor",
				full_height = true, -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
				opts = {
					breakindent = true,
					cursorcolumn = false,
					cursorline = false,
					foldcolumn = "0",
					linebreak = true,
					list = false,
					numberwidth = 1,
					signcolumn = "no",
					spell = false,
					wrap = true,
				},
			},
			show_settings = true
		},
	},
	strategies = {
		chat = {
			adapter = "anthropic",
			keymaps = {
				send = { modes = { n = "<C-s>", i = "<C-s>" },
				},
				close = {
					modes = { n = "<C-e>", i = "<C-e>" },
				},
				-- Add further custom keymaps here
			},

		},
	},
	adapters = {
		anthropic = function()
			return require("codecompanion.adapters").extend("anthropic", {
				env = {
					api_key =
					"cmd:cat ~/private-dotfiles/apikeys/anthropic.key",
				},
				schema = {
					model = {
						-- default = "claude-3-5-haiku-20241022",
						default = "claude-3-7-sonnet-20250219",
					},
				},
			})
		end,
	},
})
