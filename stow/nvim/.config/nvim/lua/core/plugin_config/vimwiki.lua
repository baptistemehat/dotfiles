-- prevent creation of temporary wiki file in the current dir
vim.g.vimwiki_global_ext = 0

-- location of wiki files
vim.g.vimwiki_list = {
	{ path = '~/vimwiki/personal', syntax = 'markdown', ext = '.wiki', diary_frequency = 'weekly' },                        -- default wiki
	{ path = '~/vimwiki/inria',    syntax = 'markdown', ext = '.wiki', diary_frequency = 'weekly' } -- second wiki, accessed with '2<leader>ww'
}

vim.g.vimwiki_auto_header = 1

vim.api.nvim_create_autocmd({ 'BufNewFile' }, {
	pattern = { "*diary/*.md" },
	command = "0r! ~/.config/nvim/vimwiki-diary-template.py '%'",
})
