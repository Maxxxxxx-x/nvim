vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.guicursor = ""


-- vim.opt.clipboard = "unnamedplus"
-- if vim.fn.has("wsl") == 1 then
--    vim.api.nvim_create_autocmd("TextYankPost", {
--        group = vim.api.nvim_create_augroup("Yank", { clear = true }),
--        callback = function()
--            vim.fn.system("clip.exe", vim.fn.getreg('"'))
--        end
--    })
--end
