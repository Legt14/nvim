return {
    "tpope/vim-fugitive",
    lazy = true,
    keys = {
        { "<leader>ga",  ":Git fetch --all -p<cr>", desc = "Git fetch" },
        { "<leader>gl",  ":Git pull<cr>",           desc = "Git pull" },
    },
    cmd = { "G", "Git" },
}
