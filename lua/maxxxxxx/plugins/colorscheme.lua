function ChangeColors(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local colorschemes = {
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },

        config = function()
            -- ChangeColors("tokyonight-moon")
        end,
    },

    {
        "shaunsingh/nord.nvim",
        config = function()
            -- ChangeColors("nord")
        end,
    },

    {
        "rebelot/kanagawa.nvim",
        priority = 1000, -- Load this first
        config = function()
            require("kanagawa").setup({
                compile = false, -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = { bold = true },
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false, -- set to true for transparent background
                dimInactive = false, -- dim inactive windows
                colors = {}, -- override colors
                theme = "wave", -- load "wave" theme
                background = { -- map dark/light to kanagawa-wave/-lotus
                    dark = "wave",
                    light = "lotus",
                },
            })

            ChangeColors("kanagawa")
        end,
    },

    {
        "mellow-theme/mellow.nvim",
        config = function()
            -- ChangeColors("mellow")
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                disable_background = true,
                dark_variant = "main",
                dim_inactive_windows = false,
            })
            -- ChangeColors("rose-pine-moon")
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            -- ChangeColors("gruvbox")
        end,
    },
    {
        "catppuccin/nvim",
        config = function()
            -- ChangeColors("catppuccin-macchiato")
        end,
    },
}

return colorschemes
