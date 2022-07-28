require('nvim-treesitter.configs').setup {
    autotag = {
        -- recommended setup
        -- support for completing tags
        -- see plugin windwp/nvim-ts-autotag
        enable = true,
    },
    highlight = {
        enable = true,
        custom_captures = {
            -- Highlight the @return capture group with the "Identifier" highlight group.
            ["return"] = "return",
        }
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn'
        }
    },
    indent = {
        enable = true,
    }
}
