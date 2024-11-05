-- NVIM REMAPS

-- set <leader> key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- keep cursor in middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- go to next buffer
vim.keymap.set("n", "<C-n>", ":bn<CR>")
-- go to previous bufer
vim.keymap.set("n", "<C-b>", ":bp<CR>")
-- go to alternate buffer
vim.keymap.set("n", "<C-Space>", "<C-6>")
