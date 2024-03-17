local autocmd = vim.api.nvim_create_autocmd

local function augroup(name, clear)
    return vim.api.nvim_create_augroup(string.format("lazy_%s", name), { clear = clear })
end

autocmd('TextYankPost', {
    group = augroup("HighlightYank"),
    pattern = '*',
    callback = function()
        print("Yello world")
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = augroup("Maxxxxxx"),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
