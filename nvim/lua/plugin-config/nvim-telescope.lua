require("telescope").load_extension("live_grep_args")
local lga_actions = require("telescope-live-grep-args.actions")
require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["<C-d>"] = "delete_buffer",
				["<C-p>"] = require("telescope.actions.layout").toggle_preview,
				["<C-k>"] = lga_actions.quote_prompt(),
				["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
				["<C-f>"] = lga_actions.quote_prompt({ postfix = " -t " }),
				["<C-a>"] = lga_actions.quote_prompt({ prefix = "--no-ignore " }),
			},
			i = {
				["<C-d>"] = "delete_buffer",
				["<C-p>"] = require("telescope.actions.layout").toggle_preview,
				["<C-k>"] = lga_actions.quote_prompt(),
				["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
				["<C-f>"] = lga_actions.quote_prompt({ postfix = " -t " }),
				["<C-a>"] = lga_actions.quote_prompt({ prefix = "--no-ignore " }),
			},
		},
		preview = {
			hide_on_startup = true, -- hide previewer when picker starts
		},
		path_display = function(opts, path)
			local tail = require("telescope.utils").path_tail(path)
			local stop = string.find(path, tail)
			local shortPath = stop and string.sub(path, 0, stop - 2) or path
			return stop and string.format("%s -- %s", tail, shortPath) or string.format("%s", tail)
		end,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_lastused = true,
			previewer = false,
			layout_config = {
				width = 0.5,
				height = 0.5,
			},
		},
		find_files = {
			layout_config = {
				width = 0.5,
				height = 0.5,
			},
			previewer = false,
		},
	},
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			-- define mappings, e.g.
			mappings = {
				-- extend mappings
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					["<C-j>"] = lga_actions.quote_prompt({ postfix = "-t js" }),
				},
			},
			-- ... also accepts theme settings, for example:
			-- theme = "dropdown", -- use dropdown theme
			-- theme = { }, -- use own theme spec
			-- layout_config = { mirror=true }, -- mirror preview pane
		},
	},
})
