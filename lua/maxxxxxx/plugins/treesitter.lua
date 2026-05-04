return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    config = function()
        require("nvim-treesitter.config").setup({
            ensure_installed = {
                "vimdoc",
                "javascript",
                "typescript",
                "c",
                "lua",
                "rust",
                "jsdoc",
                "bash",
                "go",
                "python",
                "svelte",
            },

            sync_install = false,
            auto_install = true,
            indent = {
                enable = true,
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
        })

        require("nvim-treesitter").install({ "templ" })
    end,
}
