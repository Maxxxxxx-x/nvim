return {
    "laytan/cloak.nvim",
    config = function()
        require("cloak").setup({
            enabled = true,
            cloak_character = "*",
            highlight_group = "Comment",
            patterns = {
                {
                    file_pattern = {
                        ".env",
                        "wrangler.toml",
                        ".dev.vars",
                    },
                    cloak_pattern = "=.+",
                },
            },
        })

        vim.keymap.set("n", "<leader>ct", "<cmd>CloakToggle<cr>", { desc = "[C]loak [T]oggle" })
        vim.keymap.set("n", "<leader>cp", "<cmd>CloakPreviewLine<cr>", { desc = "[C]loak [P]review Line" })
    end,
}
