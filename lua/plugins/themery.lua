return {
    "zaldih/themery.nvim",
    keys = {
        { "<leader>c", "<cmd>Themery<cr>", desc = "Switch themes" },
    },
    config = function()
        require "config.theme"
    end
}
