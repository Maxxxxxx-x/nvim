return {
    "tpope/vim-fugitive",
    config = function()
        local function getFilePath()
            print(vim.fn.expand("%s"))
            return vim.fn.expand("%s");
        end
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>ga", function()
            return vim.cmd("Gwrite %")
        end)
        vim.keymap.set("n", "<leader>gc", function()
            local commitMessage = vim.fn.input("Commit message: ")
            return vim.cmd(string.format('Git commit %s -m "%s"', "%", commitMessage))
        end)
    end
}
