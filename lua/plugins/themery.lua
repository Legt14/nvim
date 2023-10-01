return {
    "zaldih/themery.nvim",
    event = "VeryLazy",
    lazy = true,
    keys = {
        { "<leader>co", "<cmd>Themery<cr>", desc = "Switch themes" },
    },
    config = function()
        require "config.theme"
    end
}
