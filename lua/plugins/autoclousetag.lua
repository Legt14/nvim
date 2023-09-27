return {
    'windwp/nvim-ts-autotag',
    config = function ()
        local autotag = require "nvim-ts-autotag"
        autotag.setup({
            filetypes = { "html" , "xml", "jsx", "tsx"},
        })
    end,

}
