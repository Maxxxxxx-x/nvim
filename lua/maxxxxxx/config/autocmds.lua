function augroup(name, clear)
    return vim.api.nvim_create_augroup(string.format("lazy_%s", name), { clear = clear })
end

local autocmd = vim.api.nvim_create_autocmd


local settings_group = augroup("GeneralSettings")

autocmd({ "TextYankPost" }, {
    group = settings_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
	    higroup = "IncSearch",
	    timeout = 40,
	})
    end
})

autocmd({ "BufWritePre" }, {
    group = augroup("Maxxxxxx"),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({ "ColorScheme" }, {
    group = augroup("RemoveBackground"),
    pattern = "*",
    callback = function()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
})

autocmd({ "fileType" }, {
    pattern = "templ",
    callback = function()
        vim.treesitter.start()
    end
})
