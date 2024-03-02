return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
        require("silicon").setup({
            font = "CascadiaCode=32",
            theme = "gruvbox",
            tab_width = 4,
            to_clipboard = true,
        })
    end
}
