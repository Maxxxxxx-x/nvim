return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        local util = require("conform.util")

        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                svelte = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                go = { "gofmt" },
                c = { "clang-format" },
                cpp = { "clang-format" },
            },

            formatters = {
                stylua = {
                    cwd = util.root_file({
                        "stylua.toml",
                        ".stylua.toml",
                        ".git",
                    }),
                },
                ["clang-format"] = {
                    prepend_args = function(_, ctx)
                        local found = vim.fs.find({ ".clang-format" }, { upward = true, path = ctx.dirname })[1]
                        if found then
                            return {}
                        end

                        return { "--style={BasedOnStyle: LLVM, IndentWidth: 4, UseTab: Never}" }
                    end,
                },
            },

            default_format_opts = {
                lsp_format = "fallback",
            },

            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
        })
    end,

    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
