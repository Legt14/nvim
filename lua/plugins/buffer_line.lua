return {
    "akinsho/bufferline.nvim",
    version = "*",
    enabled = true,
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
        {'<leader>bn', '<cmd>bnext<cr>', desc = "Next buffer"},
        {'<leader>bp', '<cmd>bprevious<cr>', desc = "Previous buffer"},
        {'<leader>bd', '<cmd>bdelete<cr>', desc = "Delete buffer"},
        {'<leader>be', '<cmd>enew<cr>', desc = "Create new buffer"},
    },
    config = function()
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                mode = "buffers",
                style_preset = bufferline.style_preset.default,
                thmeable = true,
                numbers = "buffer_id",
                close_command = "bdelete! %d",
                indicator = {
                    icon = "▎", -- this should be omitted if indicator style is not 'icon'
                    style = "icon",
                },
                buffer_close_icon = "󰅖",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                truncate_names = true, -- whether or not tab names should be truncated
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true,
                    },
                },
                color_icons = true, -- whether or not to add the filetype icon highlights
            },
        })
    end,
}
