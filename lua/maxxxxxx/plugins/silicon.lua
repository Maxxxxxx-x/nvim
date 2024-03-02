return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
        require("silicon").setup({
            font = "Arial=32",
            tab_width = 4,
            output = function()
                local path = "/Users/maxx/Downloads/silicon-screenshots/"
                local file_name = vim.fn.expand("%:t")
                local date_string= os.date("!%Y-%m-%dT%H-%M-%S")
                return string.format("%s%s_%s.png", path, date_string, file_name)
            end,
            window_title = function()
                return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
            end,
        })
    end
}
