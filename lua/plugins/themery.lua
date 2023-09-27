return {
    "zaldih/themery.nvim",
    keys = {
        { "<leader>co", "<cmd>Themery<cr>", desc = "Switch themes" },
    },
    config = function()
        require "config.theme"
    end
}
