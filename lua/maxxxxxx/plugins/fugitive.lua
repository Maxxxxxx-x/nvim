return {

    "tpope/vim-fugitive",
    config = function()
        local function map(keybinds, callback)
            vim.keymap.set("n", keybinds, callback)
        end
        map("<leader>gs", vim.cmd.Git)
        map("<leader>gd", vim.cmd.Gdiff)
        map("<leader>ga", function()
            return vim.cmd("Gwrite %")
        end)
        map("<leader>gc", function()
            local commitMessage = vim.fn.input("Commit message: ")
            return vim.cmd(string.format('Git commit %s -m "%s"', "%", commitMessage))
        end)
        map("<leader>grm", function()
            return vim.cmd("Git rm %")
        end)
        map("<leader>gr", function()
            local remote = vim.fn.input("Remote: ")
            local branch = vim.fn.input("Branch: ")
            return vim.cmd(string.format("Git push %s %s", remote, branch))
        end)
    end
}
