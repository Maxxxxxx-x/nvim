return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
        require("silicon").setup({
            font = "CascadiaCode=26",
            tab_width = 4,
            output = function()
                local path = "/mnt/c/Users/user/Pictures/silicon-nvim/"
                local date_string= os.date("!%Y-%m-%dT%H-%M-%S")
                return string.format("%s%s.png", path, date_string)
            end,
            window_title = function()
                return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
            end
        })
    end
}
