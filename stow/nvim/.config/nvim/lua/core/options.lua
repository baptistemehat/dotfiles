-- NVIM OPTIONS
local opt = vim.opt

-- enable 24-bit color
opt.termguicolors = true


-- autosave
opt.autowrite = true
-- auto reload file content if modified outside vim (like git checkout)
opt.autoread = true
-- disable swap files
vim.cmd.swapfile = false


-- use spaces for tabs
opt.tabstop = 4
-- (auto) indent
opt.shiftwidth = 4
-- 'round' number of spaces in indent to a multiple of 'shiftwidth'
opt.shiftround = true


-- highlight cursor line
opt.cursorline = true
-- display line numbers
vim.wo.number = true
-- relative line numbers
vim.wo.relativenumber = true


-- highlight search results
opt.hlsearch = false
-- increamental search
opt.incsearch = true


-- always have a margin of 10 lines when scrolling
opt.scrolloff = 10

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true


-- sets default clipboard register to `+`, which is the system default in linux
opt.clipboard = "unnamedplus"

-- Default to static completion for SQL
vim.g.omni_sql_default_compl_type = 'syntax'

opt.colorcolumn = "100"
vim.api.nvim_set_hl(0, "ColorColumn", { bg='#101010' })

