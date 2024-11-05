local lspconfig = require('lspconfig')

-- MASON
-- Package manager for language servers, debugger adapters, linters, etc.
require("mason").setup({
	ensure_installed = {
		-- Debugger adapter for C/C++, rust, zig
		"codelldb",
	}
})

-- MASON-LSPCONFIG
-- Makes mason and lsp-config work together
require("mason-lspconfig").setup({
	-- List of language servers I want to be installed by default
	ensure_installed = {
		"bashls",
		"clangd",
		"cmake",
		"cssls",
		"dockerls",
		-- "gopls",
		"html",
		"jsonls",
		"lua_ls",
		"marksman",
		"pylsp",
		"rust_analyzer",
		"sqlls",
		"ts_ls",
		"yamlls",
	}
})

-- work with completion
local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
	"force",
	{},
	vim.lsp.protocol.make_client_capabilities(),
	cmp_lsp.default_capabilities()
)

local cmp = require("cmp")


local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		["<C-Space>"] = cmp.mapping.complete(),
		-- ['<CR>'] = cmp.mapping.confirm({select = true}),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer' },
	})
})


-- LANGUAGE SERVER CONFIGURATIONS --
--
-- BASH
lspconfig.bashls.setup {}

-- C/C++
lspconfig.clangd.setup {
	capabilities = capabilities,
	cmd = { 'clangd', '--background-index', '-j', '6', '--clang-tidy', '--clang-tidy-checks=modernize-*,-modernize-use-trailing-return-type', '--limit-results=0' },
}

-- CMake
lspconfig.cmake.setup {}

-- CSS
lspconfig.cssls.setup {}

-- DOCKERFILE
lspconfig.dockerls.setup {}

-- GO
-- lspconfig.gopls.setup {}

-- HTLM
lspconfig.html.setup {}

-- JSON
lspconfig.jsonls.setup {}

-- LUA
require('lspconfig').lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- add this to avoid "Undefined global 'vim'"
				globals = { 'vim' }
			}
		}
	}
})

-- MARKDOWN
lspconfig.marksman.setup {}

-- PYTHON
lspconfig.pylsp.setup {}

-- RUST
lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true
			},
			diagnostics = {
				enable = true,
			}
		}
	}
})

-- SQL
lspconfig.sqlls.setup {}

-- JS/TS
lspconfig.ts_ls.setup {}

-- YAML
lspconfig.yamlls.setup {}



-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<leader>fmt', function()
			vim.lsp.buf.format { async = true }
		end, opts)
		vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
		vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
	end,
})


vim.diagnostic.config({
	-- update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})


-- Show line diagnostics automatically in hover window
vim.o.updatetime = 1000
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
