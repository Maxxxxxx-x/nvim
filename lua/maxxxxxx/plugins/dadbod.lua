return {
    {
        "tpope/vim-dadbod",
        dependencies = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
        opts = {
            db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui",
        },
        config = function(_, opts)
            vim.g.db_ui_save_location = opts.db_ui_save_location

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "sql", "mysql", "plsql" },
                callback = function()
                    require("blink.cmp").add_file_source("dadbod", {
                        name = "Dadbod",
                        module = "blink.cmp.sources.lib.cmp_path",
                        enabled = true,
                    })
                    vim.opt_local.omnifunc = "vim_dadbod_completion#omni"
                end,
            })
        end,
        keys = {
            { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle Dadbod UI" },
        },
    },
    {
        "saghen/blink.cmp",
        opts = {
            sources = {
                per_filetype = {
                    sql = { "snippets", "dadbod", "buffer" },
                    mysql = { "snippets", "dadbod", "buffer" },
                    plsql = { "snippets", "dadbod", "buffer" },
                },
                providers = {
                    dadbod = {
                        name = "Dadbod",
                        module = "vim_dadbod_completion.blink",
                    },
                },
            },
        },
    },
}
