local M = {}
-- Useful to inspect variables
function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, {...})
	print(unpack(objects))
end

function M.esc(cmd)
  return vim.api.nvim_replace_termcodes(cmd, true, false, true)
end

return M
