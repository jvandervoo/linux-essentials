require('telescope').setup{
    defaults = {
        path_display = function(opts, path)
            local tail = require("telescope.utils").path_tail(path)
            local stop = string.find(path, tail)
            local shortPath = stop and string.sub(path, 0, stop - 2) or path
            return stop and string.format("%s -- %s", tail, shortPath) or string.format("%s", tail)
        end,
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
            mappings = {
                n = {
                    ["<c-d>"] = "delete_buffer",
                },
                i = {
                    ["<c-d>"] = "delete_buffer",
                }
            }
        },
        live_grep = {
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case"
            }
        },
        find_files = {
            file_ignore_patterns = {
                '.git',
                'node_modules'
            },
            -- find_command = {
            --     'rg',
            --     '--no-ignore',
            --     '--hidden',
            --     '--files'
            -- },
            layout_config = {
                width = 0.5,
                height = 0.5,
            },
            previewer = false,
        }
    }
}
