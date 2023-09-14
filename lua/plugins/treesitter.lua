return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    mian = "nvim-treesitter.configs",
    config = true,
    opts = {
        ensure_installed = {'typescript', 'lua', 'luadoc', 'javascript', 'astro', 'css', 'python'},
        hightlight = {
            enable = true
        },
        indent = {
            enable = true
        },
    }
}
