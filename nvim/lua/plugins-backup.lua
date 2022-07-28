-- actually requiring plugins
require 'packer'.startup(
{
    function()
        -- packer install packer hahaha
        use 'wbthomason/packer.nvim'

        use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}

        -- file browser 
        require 'plugin-config.nvim-tree'

        -- treesitter and associated language modules
        use {'nvim-treesitter/nvim-treesitter', run = {':TSUpdate'}, requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/tree-sitter-lua',
            'tree-sitter/tree-sitter-javascript',
            'tree-sitter/tree-sitter-php',
            'camdencheek/tree-sitter-dockerfile',
        }}
        require 'plugin-config.nvim-treesitter-playground'
        require 'plugin-config.nvim-treesitter'

        -- colorschemes
        use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
        use {"sainnhe/gruvbox-material"}
        use {"lunarvim/colorschemes"}
        use {"savq/melange"}
        use {"sainnhe/sonokai"}
        use {"EdenEast/nightfox.nvim"}
        use {"arcticicestudio/nord-vim"}

        -- lsp support
        use {'neovim/nvim-lspconfig', requires = {
            'williamboman/nvim-lsp-installer',
            'ray-x/lsp_signature.nvim',
        }}
        require 'plugin-config.nvim-lsp-installer'
        require 'plugin-config.nvim-lspconfig'
        require 'plugin-config.nvim-lsp_signature'

        use {'hrsh7th/nvim-cmp', requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        }}

        -- add a bunch of snippets for vsnip
        use { 'stevearc/vim-vsnip-snippets' }

        -- require 'plugin-config.nvim-cmp'

        -- fuzzy finder
        use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
        require 'plugin-config.nvim-telescope'

        -- bracket pairs
        use { 'windwp/nvim-autopairs' }
        require 'plugin-config.nvim-autopairs-nvim-cmp' -- config for nvim-autopairs with nvim-cmp

        -- tag pairs
        use { 'windwp/nvim-ts-autotag' }
        require 'plugin-config.nvim-ts-autotag' -- config for nvim-autopairs with nvim-cmp

        -- commenting out lines
        use { 'numToStr/Comment.nvim' }
        require 'plugin-config.nvim-Comment'

        -- git
        use { 'f-person/git-blame.nvim' }
        use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }
        require 'plugin-config.nvim-gitsigns'
        
        -- php cs fixer
        -- move this to the code formatter thing below
        use { 'aeke/vim-php-cs-fixer' }
        require 'plugin-config.nvim-php-cs-fixer'

        -- code formatter
        -- currently just for prettierd (installed locally)
        use { 'mhartington/formatter.nvim' }
        require 'plugin-config.nvim-formatter'

        -- debugging
        use { 'mfussenegger/nvim-dap' }
        require 'plugin-config.nvim-dap-php'

        -- tmux window navigation
        use { 'christoomey/vim-tmux-navigator' }

        use { 'duane9/nvim-rg' }

    end, 
    config = {
        git = { 
            -- php lang parser has a 4MB parser.c file wtf?
            -- increase clone timeout to allow for time to install this 
            clone_timeout = 6000
        }
    }
})
