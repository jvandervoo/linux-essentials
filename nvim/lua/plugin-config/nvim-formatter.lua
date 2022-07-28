require('formatter').setup({
    filetype = {
        css = {
            -- prettier
            function()
                return {
                    exe = "prettierd",
                    args = {vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },
        javascript = {
            -- prettier
            function()
                return {
                    exe = "prettierd",
                    args = {vim.api.nvim_buf_get_name(0)},
                    stdin = true
                }
            end
        },
        php = {
            -- pint
            function()
                local cwd = vim.fn.getcwd()
                return {
                    exe = cwd .. "/vendor/bin/pint",
                    stdin = false,
                }
            end
        }
    }
})
