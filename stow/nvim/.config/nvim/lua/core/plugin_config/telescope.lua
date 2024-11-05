require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
require('telescope').load_extension('fzf')


local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


vim.keymap.set('n', '<leader>ff', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})

--The below line replaces this: vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "<leader>fs", function()
        vim.ui.input({ prompt = "Workspace symbols: " }, function(query)
                builtin.lsp_workspace_symbols({ query = query })
        end)
end, { desc = "LSP workspace symbols" })
