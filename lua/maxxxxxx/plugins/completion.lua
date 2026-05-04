return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",

    opts = {
        keymap = {
            preset = "default",

            ["<C-l>"] = { "snippet_forward", "fallback" },
            ["<C-h>"] = { "snippet_backward", "fallback" },
        },
        appearance = {
            use_nvim_get_hl = true,
            nerd_font_variants = "mono",
        },

        snippets = { preset = "default" },

        sources = {
            default = { "lsp", "path", "snippets", "buffer", "dadbod" },
            providers = {
                dadbod = { name = "Dadbod", module = "vim_dadbod_cmpletion.blink" },
            },
        },

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
