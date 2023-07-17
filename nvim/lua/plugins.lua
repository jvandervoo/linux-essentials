-- actually requiring plugins
require("packer").startup({
    function()
        -- packer install packer hahaha
        use("wbthomason/packer.nvim")

        use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })

        -- treesitter and associated language modules
        use({
            "nvim-treesitter/nvim-treesitter",
            branch = "master",
            run = { ":TSUpdate" },
            requires = {
                -- 'nvim-treesitter/playground',
                "nvim-treesitter/tree-sitter-lua",
                "tree-sitter/tree-sitter-javascript",
                "tree-sitter/tree-sitter-php",
                "camdencheek/tree-sitter-dockerfile",
            },
        })

        -- colorschemes
        use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })

        -- lsp support
        use({
            "neovim/nvim-lspconfig",
            requires = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim", -- adapter between mason an lspconfig
                run = ":MasonUpdate",
            },
        })

        use({
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-vsnip",
                "hrsh7th/vim-vsnip",
            },
        })

        -- add a bunch of snippets for vsnip
        use({ "stevearc/vim-vsnip-snippets" })

        -- fuzzy finder
        use({
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-live-grep-args.nvim"
            }
        })

        -- bracket pairs
        use({ "windwp/nvim-autopairs" })

        -- tag pairs
        use({ "windwp/nvim-ts-autotag" })

        -- commenting out lines
        use({ "numToStr/Comment.nvim" })

        -- git
        use({ "f-person/git-blame.nvim" })
        use({ "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" })

        -- code formatter
        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

        -- debugging
        use({ "mfussenegger/nvim-dap", requires = "rcarriga/nvim-dap-ui" })

        -- tmux window navigation
        use({ "christoomey/vim-tmux-navigator" })

        -- requires
        require("plugin-config.nvim-tree")
        require("plugin-config.nvim-dap")
        require("plugin-config.nvim-dap-ui")
        require("plugin-config.nvim-null-ls")
        require("plugin-config.nvim-gitsigns")
        require("plugin-config.nvim-Comment")
        require("plugin-config.nvim-ts-autotag")         -- config for nvim-autopairs with nvim-cmp
        require("plugin-config.nvim-autopairs-nvim-cmp") -- config for nvim-autopairs with nvim-cmp
        require("plugin-config.nvim-telescope")
        require("plugin-config.nvim-cmp")
        require("plugin-config.nvim-mason")
        require("plugin-config.nvim-lspconfig")
        require("plugin-config.nvim-treesitter-playground")
        require("plugin-config.nvim-treesitter")
    end,
    config = {
        git = {
            -- php lang parser has a 4MB parser.c file wtf?
            -- increase clone timeout to allow for time to install this
            clone_timeout = 6000,
        },
    },
})
