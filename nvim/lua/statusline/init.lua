-- Simple sattus line that kinda sucks
function _G.statusline()
	return '%F | %p%%'
end
vim.o.statusline = statusline()

