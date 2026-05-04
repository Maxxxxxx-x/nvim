local function rojo_project()
    return vim.fs.root(0, function(name)
        return string.match(name, ".+%.project%.json$")
    end)
end

return {
    "lopi-py/luau-lsp.nvim",

    ft = "luau",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    opts = {
        platform = {
            type = rojo_project() and "roblox" or "standard",
        },

        types = {
            roblox_security_level = "PluginSecurity",
        },

        sourcemap = {
            enabled = true,
            autogenerate = true,
            rojo_project_file = "default.project.json",
            sourcemap_file = "sourcemap.json"
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

    config = function()
        if rojo_project() then
            vim.filetype.add({
                extension = {
                    lua = function(path)
                        return string.match(path, "%.nvim%.lua$") and "lua" or "luau"
                    end
                }
            })
        end
    end
}
