require('gitsigns').setup {
	signs                        = {
		add          = { text = '┃'},
		change       = { text = '┃'},
		delete       = { text = '_', show_count = true },
		topdelete    = { text = '‾', show_count = true },
		changedelete = { text = '~', show_count = true },
		untracked    = { text = '┆'},
	},
	signs_staged                 = {
		add          = { text = '┃'},
		change       = { text = '┃'},
		delete       = { text = '_', show_count = true },
		topdelete    = { text = '‾', show_count = true },
		changedelete = { text = '~', show_count = true },
		untracked    = { text = '┆'},
	},
	diff_opts                    = {
		internal = true,
	},
	signs_staged_enable          = true,
	signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir                 = {
		enable = true,
		follow_files = true
	},
	auto_attach                  = true,
	attach_to_untracked          = false,
	count_chars                  = { "1", "2", "3", "4", "5", "6", "7", "8", "9", ["+"] = "+" },
	current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts      = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = '<author>, <author_time:%R> - <abbrev_sha> <summary>',
	sign_priority                = 6,
	update_debounce              = 100,
	status_formatter             = nil, -- Use default
	max_file_length              = 40000, -- Disable if file is longer than this (in lines)
	preview_config               = {
		-- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1,
	},
}

-- vim.api.nvim_set_hl(0, 'Gitsigns<name>', { bg="00434f" })
