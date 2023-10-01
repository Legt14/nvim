return {
    'wuelnerdotexe/vim-astro',
    event = "VeryLazy",
    config = function ()
        vim.g.astro_typescript = 'enable'
        vim.g.astro_stylus = 'enable'
    end
}
