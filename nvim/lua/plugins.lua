local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },

	-- treesitter and associated language modules
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/tree-sitter-lua",
			"tree-sitter/tree-sitter-javascript",
			"tree-sitter/tree-sitter-php",
			"camdencheek/tree-sitter-dockerfile",
		},
	},

	-- colorschemes
	{ "ellisonleao/gruvbox.nvim", dependencies = { "rktjmp/lush.nvim" } },

	-- lsp support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
		},
	},

	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
	},

	-- bracket pairs
	{ "windwp/nvim-autopairs" },

	-- tag pairs
	{ "windwp/nvim-ts-autotag" },

	-- commenting out lines
	{ "numToStr/Comment.nvim" },

	-- git
	{ "f-person/git-blame.nvim" },
	{ "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-- code formatter
	{ "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-- debugging tools
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
	},

	-- tmux window navigation
	{ "christoomey/vim-tmux-navigator" },

	-- session management
	{ "rmagatti/auto-session" },
}, {
	git = {
		timeout = 6000,
	},
})

-- requires
require("plugin-config.nvim-tree")
require("plugin-config.nvim-dap")
require("plugin-config.nvim-dap-ui")
require("plugin-config.nvim-none-ls")
require("plugin-config.nvim-Comment")
require("plugin-config.nvim-ts-autotag")
require("plugin-config.nvim-autopairs-nvim-cmp")
require("plugin-config.nvim-telescope")
require("plugin-config.nvim-mason")
require("plugin-config.nvim-lspconfig")
require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-gitsigns")
require("plugin-config.nvim-cmp")
require("plugin-config.nvim-auto-session")
