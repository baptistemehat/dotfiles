-- prevent creation of temporary wiki file in the current dir
vim.g.vimwiki_global_ext = 0

-- location of wiki files
vim.g.vimwiki_list = {
	{ path = '~/vimwiki/personal', syntax = 'markdown', ext = '.wiki' }, -- default wiki
	{ path = '~/vimwiki/inria',    syntax = 'markdown', ext = '.wiki' } -- second wiki, accessed with '2<leader>ww'
}

-- enable to check chekboxes in wiki files
vim.keymap.set("n", "<leader>wx", ":VimwikiToggleListItem<CR>")
