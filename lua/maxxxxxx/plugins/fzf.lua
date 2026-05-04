return {
    "ibhagwan/fzf-lua",
    -- Optional: adds file icons
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local fzf = require("fzf-lua")

        fzf.setup({
            -- Equivalent to Telescope's 'defaults'
            winopts = {
                height = 0.85,
                width = 0.80,
                preview = {
                    layout = "vertical", -- Better for smaller screens
                },
            },
            files = {
                -- Equivalent to hidden = true in Telescope
                fd_opts = [[--color=never --type f --hidden --follow --exclude .git]],
            },
            grep = {
                -- Improves the grep experience
                rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
            }
        })

        -- Keybindings
        vim.keymap.set("n", "<leader>pf", fzf.files, { desc = "Fzf Files" })
        vim.keymap.set("n", "<C-p>", fzf.git_files, { desc = "Fzf Git Files" })

        -- Workspace Word Search (cWORD)
        vim.keymap.set("n", "<leader>ws", fzf.grep_cword, { desc = "Fzf Grep Current Word" })

        -- Manual Grep Search
        -- fzf-lua's live_grep is often preferred, but here is the manual input version:
        vim.keymap.set("n", "<leader>ps", fzf.live_grep, { desc = "Fzf Live Grep" })

        vim.keymap.set("n", "<leader>vh", fzf.help_tags, { desc = "Fzf Help Tags" })
    end
}

