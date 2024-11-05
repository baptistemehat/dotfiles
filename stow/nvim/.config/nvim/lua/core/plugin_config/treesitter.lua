require 'nvim-treesitter.configs'.setup {
    autotag = {
        enable = true,
    },
    -- A list of parser names, or "all"
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "javascript",
        "json",
        "jsonc",
        -- "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "sql",
        "vim",
        "yaml"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}
