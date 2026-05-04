vim.g.mapleader = " "

-- show file tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- concat next line
vim.keymap.set("n", "J", "mzJ`z")

-- jump half page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- saerch with curcer at center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without weird thing
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to clipboard
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to void
vim.keymap.set("n", "<leader>d", [["_d]])
vim.keymap.set("v", "<leader>d", [["_d]])

-- format code in buffer
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end)

-- find and replace word at cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- change perm to executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- silicon screenshot
vim.keymap.set("v", "<C-s>", ":Silicon<cr>")

vim.keymap.set("n", "<leader>u", function()
    require("fzf-lua").undotree()
end)

-- trim ^M
vim.keymap.set("n", "<leader>,m", function()
    vim.cmd([[silent! %s/\r//g]])
    vim.cmd([[w]])
end)
