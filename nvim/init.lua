-- Installs packer on the first load. Not super nice but helpful for cloning dots to another machine
if require 'packer-install'() then
	return
end

-- general config
require 'map-n-cheese'
require 'statusline'
require 'utils'
require 'options'
require 'colors'
require 'plugins'
require 'autocmds'
