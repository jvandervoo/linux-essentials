-- Install packer (for when you use this config for the first time)
local download_packer = function()
    if vim.fn.input 'Download Packer (y/n)? [y] ' == 'n' then
        return

    end

    print 'Downloading packer.nvim...'

    local dir = string.format('%s/site/pack/packer/start', vim.fn.stdpath 'data')


    print(string.format('Creating directory %s', dir .. '/packer.nvim'))
    vim.fn.mkdir(dir, 'p')

    local out = vim.fn.system(
    string.format('git clone %s %s', 'https://github.com/wbthomason/packer.nvim', dir .. '/packer.nvim')
    )


    print(out)

    print 'Success!\n'
    print 'You\'ll need to restart vim'

    if vim.fn.input 'Quit now? (y/n)? [y] ' ~= 'n' then
        return vim.cmd [[:qa!]]
    end
end


return function()
    if not pcall(require, 'packer') then
        download_packer()
        return true
    end
    return false
end

