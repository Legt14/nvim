return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        {"<leader>e", "<cmd>NvimTreeToggle<cr>", desc='File Explorer'}
    },
    config = function ()
        local tree = require "nvim-tree"

        tree.setup({
            sort_by = "case_sensitive",
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true
            },
            })
    end
}
