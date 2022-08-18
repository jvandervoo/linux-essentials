local dap = require('dap')
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/vscode-php-debug/out/phpDebug.js' }
}

-- grab the current directory to map for debugging
-- (no newline character)
local handle = io.popen("pwd")
local cd = string.gsub(handle:read("*a"), "\n", "")
handle:close()

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9000,
        xdebugSettings = {
            max_children = 999
        },
        pathMappings = {
            ["/var/www/html"] = cd
        }
    }
}
