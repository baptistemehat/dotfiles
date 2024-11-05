-- bufferline uses tab line to display buffer names
-- set nvim to always show the tabline
vim.opt.showtabline = 2

-- source: https://github.com/akinsho/bufferline.nvim
vim.opt.termguicolors = true

-- simple configuration to only display buffer names
local bufferline = require('bufferline')
bufferline.setup {
	options = {
		mode = "buffers",
		style_preset = bufferline.style_preset.default,
		numbers = "none",
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = false,
		show_duplicate_prefix = true,
		sort_by = 'insert_at_end',
	}
}
