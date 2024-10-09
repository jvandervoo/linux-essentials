-- Mmmmmm.... cheese
local map = vim.api.nvim_set_keymap
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

-- Leader
map("", "<Space>", "\\", { noremap = false, silent = true })

-- Line movement
map("n", "E", "$", { noremap = true, silent = true })
map("n", "B", "^", { noremap = true, silent = true })
map("v", "E", "$", { noremap = true, silent = true })
map("v", "B", "^", { noremap = true, silent = true })

-- Window movement
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
map("n", "<C-w>", ":close<Cr>", { noremap = true, silent = true })

-- Copy file path to clipboard
map("n", "<Leader>cp", ':let @+ = expand("%")<Cr>', { noremap = true, silent = true })

-- LSP
map("n", "gD", ":lua vim.lsp.buf.declaration()<Cr>", { noremap = true, silent = true })
map("n", "gd", ":Telescope lsp_definitions<Cr>", { noremap = true, silent = true })
map("n", "K", ":lua vim.lsp.buf.hover()<Cr>", { noremap = true, silent = true })
map("n", "<Leader>.", ":lua vim.lsp.buf.code_action()<Cr>", { noremap = true, silent = true })
map("n", "<Leader>dd", ":lua vim.diagnostic.open_float()<Cr>", { noremap = true, silent = true })
map("n", "<Leader>dl", ":lua vim.diagnostic.goto_next()<Cr>", { noremap = true, silent = true })
map("n", "<Leader>dh", ":lua vim.diagnostic.goto_prev()<Cr>", { noremap = true, silent = true })

-- Telescope
map(
	"n",
	"<Leader>ff",
	':lua require("telescope.builtin").find_files({hidden=true})<Cr>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<Leader>fF",
	':lua require("telescope.builtin").find_files({hidden=true, no_ignore=true})<Cr>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>fg",
	':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>',
	{ noremap = true, silent = true }
)
vim.keymap.set("v", "<leader>fv", live_grep_args_shortcuts.grep_visual_selection)
map(
	"n",
	"<Leader>fG",
	':lua require("telescope.builtin").live_grep({hidden=true, no_ignore=false})<Cr>',
	{ noremap = true, silent = true }
)
map("n", "<Leader>fb", ":Telescope buffers<Cr>", { noremap = true, silent = true })

-- show class properties and methods
map(
	"n",
	"<Leader>fs",
	':lua require("telescope.builtin").lsp_document_symbols({symbols = {"property", "method"}})<Cr>',
	{ noremap = true, silent = true }
)
-- show references
map("n", "<Leader>fr", ':lua require("telescope.builtin").lsp_references()<Cr>', { noremap = true, silent = true })
map("n", "<Leader>fR", ":Telescope resume<Cr>", { noremap = true, silent = true })

-- Nvim Tree
map("n", "<Leader>ee", ":NvimTreeToggle<Cr>:set nu<Cr>:set rnu<Cr>", { noremap = true, silent = true })
map("n", "<Leader>ef", ":NvimTreeFindFile<Cr>:set nu<Cr>:set rnu<Cr>", { noremap = true, silent = true })

-- Tab navigation
map("n", "tt", ":tab split<Cr>", { noremap = true, silent = true })
map("n", "tc", ":tabc<Cr>", { noremap = true, silent = true })
map("n", "tn", ":tabn<Cr>", { noremap = true, silent = true })
map("n", "tp", ":tabp<Cr>", { noremap = true, silent = true })

-- Debugging
map("n", "<F1>", ":lua require'dapui'.toggle()<Cr>", { noremap = true, silent = true })
map("n", "<F2>", ":lua require'dap'.list_breakpoints(true)<Cr>", { noremap = true, silent = true })
map("n", "<F3>", ":lua require'dap.breakpoints'.clear()<Cr>", { noremap = true, silent = true })
map("n", "<F4>", ":lua require'dap'.disconnect()<Cr>:lua require'dap'.close()<Cr>", { noremap = true, silent = true })
map("n", "<F5>", ":lua require'dap'.continue()<Cr>", { noremap = true, silent = true })
map("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<Cr>", { noremap = true, silent = true })
map("n", "<F10>", ":lua require'dap'.step_over()<Cr>", { noremap = true, silent = true })
map("n", "<F11>", ":lua require'dap'.step_into()<Cr>", { noremap = true, silent = true })
map("n", "<F12>", ":lua require'dap'.step_out()<Cr>", { noremap = true, silent = true })

-- Sessions
map("n", "<Leader>ts", ":Telescope session-lens<Cr>", { noremap = true, silent = true })

-- Quickfix list
map("n", "<Leader>n", ":cn<Cr>", { noremap = true, silent = true })
map("n", "<Leader>p", ":cp<Cr>", { noremap = true, silent = true })

-- navigating snippets
map("i", "<Tab>", 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<TAB>"', { silent = true, expr = true })
map("s", "<Tab>", 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<TAB>"', { silent = true, expr = true })
map("i", "<S-Tab>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-TAB>"', { silent = true, expr = true })
map("s", "<S-Tab>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-TAB>"', { silent = true, expr = true })
