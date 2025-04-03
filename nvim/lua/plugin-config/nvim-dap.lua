local dap = require("dap")
dap.adapters.php = {
	type = "executable",
	command = "node",
	-- you need to clone vscode php debug repo in your home directory
	-- in order for the adapter to be available
	args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" },
}

-- grab the current directory to map for debugging
-- (no newline character)
local handle = io.popen("pwd")
local cd = string.gsub(handle:read("*a"), "\n", "")
handle:close()

dap.configurations.php = {
	{
		type = "php",
		request = "launch",
		name = "Port 9000",
		port = 9000,
		xdebugSettings = {
			max_children = 999,
		},
		pathMappings = {
			["/var/www/html"] = cd,
		},
	},
	{
		type = "php",
		request = "launch",
		name = "Port 9003",
		port = 9003,
		xdebugSettings = {
			max_children = 999,
		},
		pathMappings = {
			["/var/www/html"] = cd,
		},
	},
}
