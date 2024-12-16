return {
    'echasnovski/mini.files',
    version = false,
    config = function()
        require('mini.icons').setup()
        require('mini.files').setup({
            mappings = {
                go_in_plus = '<Enter>',
                reset = '<Del>',
                go_out = '<BS>',
                close = '<Esc>',
            }
        })

        local map_split = function(buf_id, lhs, direction)
            local rhs = function()
                -- Make new window and set it as target
                local new_target_window
                vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window, function()
                    vim.cmd(direction .. ' split')
                    new_target_window = vim.api.nvim_get_current_win()
                end)

                MiniFiles.set_target_window(new_target_window)
            end

            -- Adding `desc` will result into `show_help` entries
            local desc = 'Split ' .. direction
            vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
        end

        vim.api.nvim_create_autocmd('User', {
            pattern = 'MiniFilesBufferCreate',
            callback = function(args)
                local buf_id = args.data.buf_id
                -- Tweak keys to your liking
                map_split(buf_id, '<C-x>', 'belowright horizontal')
                map_split(buf_id, '<C-v>', 'belowright vertical')
            end,
        })

        local files_set_cwd = function(path)
            -- Works only if cursor is on the valid file system entry
            local cur_entry_path = MiniFiles.get_fs_entry().path
            local cur_directory = vim.fs.dirname(cur_entry_path)
            vim.fn.chdir(cur_directory)
        end

        vim.api.nvim_create_autocmd('User', {
            pattern = 'MiniFilesBufferCreate',
            callback = function(args)
                vim.keymap.set('n', 'g~', files_set_cwd, { buffer = args.data.buf_id })
            end,
        })
    end,
    dependencies = {
        { 'echasnovski/mini.icons', version = false },
    },
}
