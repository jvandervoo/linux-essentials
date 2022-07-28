-- Config for LSP related stuff
-- lspinstall
-- lspconfig
-- completion
-- local lsp_installer = require("nvim-lsp-installer")
-- 
-- local lsp_installer_servers = require'nvim-lsp-installer.servers'
-- 
-- for _, server in pairs(lsp_installer_servers) do
--     lsp_installer.on_server_ready(function(server) 
--         local opts = {
--             capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--         }
--         server:setup(opts)
--     end)
-- end


local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
         -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
    if server.name == "denols" then
        opts.root_dir = function()
            return vim.fn.getcwd()
        end
    end


    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
