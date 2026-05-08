return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdate", "TSInstall" },
    opts = {
        highlight = { enable = true, additional_vim_regex_highlighting = false },
        indent = { enable = true },
        ensure_installed = {
            "bash",
            "c",
            "diff",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "lua",
            "luau",
            "luadoc",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "svelte",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
        },
    },
    config = function(_, opts)
        require("nvim-treesitter").setup(opts)

        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = "svelte",
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
