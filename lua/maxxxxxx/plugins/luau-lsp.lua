return {
    "lopi-py/luau-lsp.nvim",

    ft = "luau",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    init = function()
        vim.lsp.config("*", {
            capabilities = {
                workspace = {
                    didChangeWatchedFiles = {
                        dynamicRegistration = true,
                    },
                },
            },
        })
    end,

    opts = {
        platform = {
            type = "roblox",
        },

        types = {
            roblox_security_level = "PluginSecurity",
        },

        sourcemap = {
            enabled = true,
            autogenerate = true,
            rojo_project_file = "default.project.json",
            sourcemap_file = "sourcemap.json",
        },

        plugin = {
            enabled = true,
            port = 3667,
        },

        fflags = {
            enable_new_resolver = true,
            sync = true,
        },
    },
}
