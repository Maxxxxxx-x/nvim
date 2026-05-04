return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- ... keep your existing signs config ...
        on_attach = function(bufnr)
            local gs = require("gitsigns")
            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

            -- Navigation
            map("n", "]c", gs.next_hunk, "Next Git Hunk")
            map("n", "[c", gs.prev_hunk, "Prev Git Hunk")

            -- Hunk Actions (The 's' stands for Stage Hunk)
            map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
            map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
            map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")
            map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
            map("n", "<leader>gb", gs.blame_line, "Blame Line")
        end,
    },
}
