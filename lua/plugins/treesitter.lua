return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    main = "nvim-treesitter.configs",
    config = true,
    opts = {
        ensure_installed = {
            "typescript",
            "lua",
            "luadoc",
            "javascript",
            "astro",
            "css",
            "python",
            "tsx",
            "html"
        },
        hightlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        -- additional_vim_regex_highlighting = true,
        sync_install = false,
        auto_install = false
    },
}
