return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiff)
        vim.keymap.set("n", "<leader>ga", ":Git add")
        vim.keymap.set("n", "<leader>gc", vim.cmd.Gcommit)
        vim.keymap.set("n", "<leader>gam", vim.cmd.Gammend)
    end
}
