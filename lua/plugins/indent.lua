return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        vim.opt.termguicolors = true
        vim.cmd([[highlight IndentBlanklineIndent1 guifg=#8661ae gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent2 guifg=#24d282 gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent3 guifg=#8661ae gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent4 guifg=#24d282 gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent5 guifg=#8661ae gui=nocombine]])
        vim.cmd([[highlight IndentBlanklineIndent6 guifg=#24d282  gui=nocombine]])

        vim.opt.list = true

        require("indent_blankline").setup({
            space_char_blankline = " ",
            char_highlight_list = {
                "IndentBlanklineIndent1",
                "IndentBlanklineIndent2",
                "IndentBlanklineIndent3",
                "IndentBlanklineIndent4",
                "IndentBlanklineIndent5",
                "IndentBlanklineIndent6",
            },
        })
    end,
}