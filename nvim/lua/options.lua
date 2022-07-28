local v = vim.o

-- nice options
v.nu = true
v.relativenumber = true
v.tabstop = 4
v.shiftwidth = 4
v.softtabstop = 4
v.expandtab = true
v.hlsearch = false
v.wrap = false
v.scrolloff = 8
v.splitbelow = true
v.splitright = true
v.hidden = true
v.mouse = 'a'
v.undofile = true
v.signcolumn = 'yes'
v.incsearch = true
v.swapfile = false
v.backup = false
v.showmode = true

-- always yank to clipboard
vim.cmd [[set clipboard+=unnamedplus]]
-- vim.cmd [[set jumpoptions+=stack]]

-- autocommands
-- vim.api.nvim_command([[
-- autocmd FileType php set iskeyword+=$
-- ]])

-- vim diagnostics
vim.diagnostic.config({
    virtual_text = false, 
    float = {
        width = 50
    },
    severity_sort = true
})
