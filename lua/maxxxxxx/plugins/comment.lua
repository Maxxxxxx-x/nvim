return {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function(_, opts)
        require("Comment").setup(opts)
    end,
}
