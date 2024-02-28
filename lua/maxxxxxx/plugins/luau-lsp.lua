return {
    "lopi-py/luau-lsp.nvim",

    ft = { "lua", "luau" },

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local luau_lsp = require("luau-lsp")
        luau_lsp.setup({
            sourcemap = {
                enabled = true,
                autogenerate = true,
                rojo_project_file = "default.project.json",
            },

            types = {
                roblox = true,
                roblox_security_level = "PluginSecurity"
            },

            server = {
                filetypes = { "lua", "luau" },
            },
        })
    end
}
