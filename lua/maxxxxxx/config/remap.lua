vim.g.mapleader = " "

-- show file tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--move lines 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


--concat next line, separated by space
vim.keymap.set("n", "J", "mzJ`z")


--jump half page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


--search with cursor at center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


--paste without weird things happening
vim.keymap.set("x", "<leader>p", [["_dP]])


--copy to system clipboard
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


--deletes stuff into void
vim.keymap.set("n", "<leader>d", [["_d]])
vim.keymap.set("v", "<leader>d", [["_d]])


--im pretty sure this formats the code in buffer (at least I hope)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--find and replace words at the curser
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--turn file into executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- takes screenshot
vim.keymap.set("v", "<leader><leader>", ":Silicon<cr>")
