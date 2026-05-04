return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                svelte = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                go = { "gofmt" },
            },

            formatters = {
                stylua = {
                    cwd = require("conform.util").root_file({
                        "stylua.toml",
                        ".stylua.toml",
                        ".git",
                    }),
                },
            },

            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
        })
    end,
}
