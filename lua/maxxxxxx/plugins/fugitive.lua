return {
    "tpope/vim-fugitive",
    keys = {
        { "<leader>gg", vim.cmd.Git, desc = "Git Status (Fugitive)" },
        { "<leader>gd", vim.cmd.Gdiff, desc = "Git Diff" },
        { "<leader>ga", "<cmd>Gwrite<cr>", desc = "Git Add Current File" },
        -- Simplified commit: just use 'cc' inside the Fugitive window for better control
        { "<leader>gc", ":Git commit -m ", desc = "Git Commit" },
        { "<leader>gp", ":Git push ", desc = "Git Push" },
    },
}
