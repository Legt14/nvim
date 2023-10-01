return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    main = "nvim-treesitter.configs",
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
            "html",
        },
        hightlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        -- additional_vim_regex_highlighting = true,
        sync_install = true,
        auto_install = true,
        autotag = {
            enable = true,
        },
    },
}
