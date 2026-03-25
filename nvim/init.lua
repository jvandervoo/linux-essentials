

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
