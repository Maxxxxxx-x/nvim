function GetColors()
    local colors = {
        "tokyonight",
        "rose-pine",
        "rose-pine-main",
        "rose-pine-moon",
        "rose-pine-dawn",
        "gruvbox"
    }
    print(table.concat(colors, "\n"))
end

function ClearBg()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFLoat", { bg = "none" })
end

function ChangeColors(color)
    color = color or "rose-pine"
    vim.cmd(string.format("colorscheme %s", color))
    ClearBg()
end

return {
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent"
            }
        },
        config = function()
            -- vim.cmd("colorscheme tokyonight")
        end
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

            ColorMyPencils()
            vim.cmd("colorscheme rose-pine")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        config = function()
            ChangeColors("gruvbox")
        end,
    },
}
