local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- format on save
-- think this was used for format.nvim
-- local formatGroup = augroup("FormatAutogroup", { clear = true })
-- autocmd("BufWritePost", {
--     command = "FormatWrite",
--     group = formatGroup,
--     pattern = "*",
-- });
--
