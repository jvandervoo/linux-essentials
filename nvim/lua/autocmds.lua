local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- format on save
local formatGroup = augroup("FormatAutogroup", { clear = true })
autocmd("BufWritePost", {
    command = "FormatWrite",
    group = formatGroup,
    pattern = "*",
});

