return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim', 
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local telescope = require "telescope"
        local actions = require "telescope.actions"
        
        telescope.setup({
            defaults = {
                i = {
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
                }
            }
        })

        telescope.load_extension("fzf")
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Find in Files"})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Find string" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc= "Find in Buffers"})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find in History"})
        vim.keymap.set('n', '<leader>fc', builtin.grep_string, {desc = "Find string under cursor"} )
    end
    }
