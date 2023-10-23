function Kmap(mode, key, effect, desc)
    vim.api.nvim_set_keymap(mode, key, effect, { noremap = true, desc = desc })
end

Kmap('n', '<leader>lk', '<cmd>call append(line(".")-1, "")<CR>', 'Insert new line top')
Kmap('n', '<leader>lj', '<cmd>call append(line("."), "")<CR>', 'Insert new line down')
