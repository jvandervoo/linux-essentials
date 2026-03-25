-- Attempt to install packer if not present
local should_bootstrap = require('packer-install')()
if should_bootstrap then
	-- Exit early after bootstrap to allow proper plugin setup on next launch
	return
end

-- general config
local function safe_require(module)
    local ok, _ = pcall(require, module)
    if not ok then
        vim.notify('Error loading ' .. module, vim.log.levels.ERROR)
    end
end

safe_require 'map-n-cheese'
safe_require 'statusline'
safe_require 'utils'
safe_require 'options'
safe_require 'plugins'
safe_require 'colors'
safe_require 'autocmds'
