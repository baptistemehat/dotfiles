-- PLUGIN LIST (PACKER)

-- ensure packer is installed
-- source: https://github.com/wbthomason/packer.nvim
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- TREESITTER
	-- Parser providing better syntax highlight, indent, folding on current buffer
	--
	-- treesitter
	use 'nvim-treesitter/nvim-treesitter'
	-- playground to display treesitter AST
	use 'nvim-treesitter/playground'


	-- LANGUAGE SERVER
	-- Enable nvim to manage and talk to language servers
	--
	-- mason package manager for LSP, DAP, linters, etc.
	use 'williamboman/mason.nvim'
	-- ready-to-use configs for LSPs
	use 'neovim/nvim-lspconfig'
	-- make mason and lsp-config work together
	use 'williamboman/mason-lspconfig.nvim'


	-- COMPLETION TOOLS
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	-- Useful completion sources:
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/vim-vsnip'


	-- TELESCOPE
	-- Multi-purpose Fuzzy finder
	-- Can search for filenames, lsp symbols, git commits, etc.
	--
	-- telescope
	use({
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		requires = { { 'nvim-lua/plenary.nvim' } }
	})
	-- telescope fzf for better search performances
	use { 'nvim-telescope/telescope-fzf-native.nvim', run =
	'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }


	-- UNDO TREE
	-- undo history visualizer
	use 'mbbill/undotree'


	-- NVIM TREE
	-- Provides directory tree within nvim
	--
	-- nvim-tree
	use 'nvim-tree/nvim-tree.lua'
	-- devicons for nvim-tree file icons
	use 'nvim-tree/nvim-web-devicons'


	-- TOGGLE TERM
	-- Terminal window within nvim
	use { 'akinsho/toggleterm.nvim', tag = '*' }


	-- COMMENT
	-- Provides keymaps for commenting
	use 'numToStr/Comment.nvim'


	-- SYMBOL PAIRING
	-- Autopairs '{}' '()', etc.
	use 'windwp/nvim-autopairs'
	-- Autopair for xml tags
	use 'windwp/nvim-ts-autotag'
	-- Surround elements with delimiter '()', '{}', etc.
	use { 'kylechui/nvim-surround', tag = '*', }


	-- VIMWIKI
	-- Personal wiki
	use 'vimwiki/vimwiki'
	use 'mattn/calendar-vim'


	-- GITSIGNS
	-- Show git git indicators in file (line added, line modified, etc.)
	use 'lewis6991/gitsigns.nvim'


	-- COLOR SCHEME
	use 'iagorrr/noctishc.nvim'


	-- BUFFERLINE
	-- Display buffer names in a tab-like fashion
	use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' }


	-- LUALINE
	-- Improve nvim status line
	use { 'nvim-lualine/lualine.nvim' }


	-- VIM BE GOOD
	-- Vim motion training
	use 'ThePrimeagen/vim-be-good'


	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
