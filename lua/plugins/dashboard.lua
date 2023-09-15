return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {

            [[                                                ]],
            [[                                          _.oo. ]],
            [[                  _.u[[/;:,.         .odMMMMMM' ]],
            [[               .o888UU[[[/;:-.  .o@P^    MMM^   ]],
            [[              oN88888UU[[[/;::-.        dP^     ]],
            [[             dNMMNN888UU[[[/;:--.   .o@P^       ]],
            [[            ,MMMMMMN888UU[[/;::-. o@^           ]],
            [[            NNMMMNN888UU[[[/~.o@P^              ]],
            [[            888888888UU[[[/o@^-..               ]],
            [[           oI8888UU[[[/o@P^:--..                ]],
            [[        .@^  YUU[[[/o@^;::---..                 ]],
            [[      oMP     ^/o@P^;:::---..                   ]],
            [[   .dMMM    .o@^ ^;::---...                     ]],
            [[  dMMMMMMM@^`       `^^^^                       ]],
            [[ YMMMUP^                                        ]],
            [[  ^^                                            ]],
            [[                                                ]],
        }
        dashboard.section.header.opts.hl = "Include"
        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end,
}
