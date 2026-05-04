return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
        require("nvim-silicon").setup({
            font = "CascadiaCode=26",
            tab_width = 4,
            language = function()
                local filetype = vim.bo.filetype
                if filetype == "luau" then
                    filetype = "lua"
                end
                return filetype
            end,
            shadow_blur_radius = 16,
            background_image = "/home/maxx/.config/nvim/images/Hawaiii.jpg",
            to_clipboard = true,
            wslclipboard = "always",
            wslclipboardcopy = "keep",
            output = function()
                local path = "/mnt/c/Users/maxx/Pictures/silicon-nvim/"
                local date_string = os.date("!%Y-%m-%dT%H-%M-%S")
                print(string.format("%s%s.png", path, date_string))
                return string.format("%s%s.png", path, date_string)
            end,
            window_title = function()
                return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
            end,
        })
    end,
}
