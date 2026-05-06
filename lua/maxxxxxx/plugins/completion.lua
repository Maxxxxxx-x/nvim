return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "saghen/blink.lib",
    },
    version = "*",

    build = function()
        require("blink.cmp").build():wait(60000)
    end,

    opts = {
        keymap = {
            preset = "default",

            ["<C-l>"] = { "snippet_forward", "fallback" },
            ["<C-h>"] = { "snippet_backward", "fallback" },
        },

        snippets = { preset = "default" },

        sources = {
            default = { "lsp", "path", "snippets", "buffer", "dadbod" },
            providers = {
                dadbod = { name = "Dadbod", module = "vim_dadbod_cmpletion.blink" },
            },
        },

        fuzzy = { implementation = "rust" },

        completion = {
            menu = {
                border = "rounded",
            },
            documentation = {
                window = { border = "rounded" },
                auto_show = true,
                auto_show_delay_ms = 500,
            },
        },
    },
}
