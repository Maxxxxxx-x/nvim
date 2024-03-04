return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiff)
        vim.keymap.set("n", "<leader>ga", vim.cmd("Gwrite %"))
        vim.keymap.set("n", "<leader>gc", function()
            print("Commit")
            local commitMessage = vim.fn.input("Commit message: ")
            return vim.cmd(string.format("Git commit %s -m %s", "%", commitMessage))
        end)
        vim.keymap.set("n", "<leader>grm", vim.cmd("Git rm %"))
        vim.keymap.set("n", "<leader>gr", function()
            local remote = vim.fn.input("Remote: ")
            local branch = vim.fn.input("Branch: ")
            return vim.cmd(string.format("Git push %s %s", remote, branch))
        end)
    end
}
