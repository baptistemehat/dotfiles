-- prevent creation of temporary wiki file in the current dir
vim.g.vimwiki_global_ext = 0

-- location of wiki files
vim.g.vimwiki_list = {{path = '~/vimwiki', syntax = 'markdown', ext = '.wiki'}}

-- enable to check chekboxes in wiki files
vim.keymap.set("n", "<leader>wx", ":VimwikiToggleListItem<CR>")
