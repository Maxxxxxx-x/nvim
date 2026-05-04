return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        -- Keymaps
        vim.keymap.set("n", "<leader>af", function()
            harpoon:list():add()
        end, { desc = "Harpoon: Add File" })
        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon: Toggle Menu" })

        -- Select files 1-4 (standardized to 4 as that's the muscle memory sweet spot)
        vim.keymap.set("n", "<C-h>", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<C-j>", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<C-k>", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<C-l>", function()
            harpoon:list():select(4)
        end)

        -- Quick Navigation through the list
        vim.keymap.set("n", "<C-S-P>", function()
            harpoon:list():prev()
        end)
        vim.keymap.set("n", "<C-S-N>", function()
            harpoon:list():next()
        end)
    end,
}
