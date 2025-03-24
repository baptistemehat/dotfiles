vim.o.termguicolors = true
vim.cmd 'colorscheme noctishc'

vim.cmd [[
  highlight DiffAdd    guibg=#003000 guifg=NONE
  highlight DiffChange guibg=#303000 guifg=NONE cterm=NONE gui=NONE
  highlight DiffDelete guibg=#300000 guifg=NONE
  highlight DiffText   guibg=#4d3000 guifg=NONE
]]

-- Transparent nvim background
-- vim.cmd [[
--   highlight Normal guibg=none
--   highlight NonText guibg=none
--   highlight Normal ctermbg=none
--   highlight NonText ctermbg=none
-- ]]
