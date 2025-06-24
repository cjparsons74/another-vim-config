-- Other mappings are in telescope.lua etc. that use Which Key
vim.keymap.set("n", "<C-p>", "<cmd>cprev<cr>", { desc = "Quickfix prev" })
vim.keymap.set("n", "<C-n>", "<cmd>cnext<cr>", { desc = "Quickfix next" })
vim.keymap.set("n", "<Del>", "<Esc>", { desc = "Do not delete in normal mode" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Alternate Esc" })
vim.keymap.set("n", "gf", ":e <cfile><CR>", { desc = "Open a file that does not exist" })
vim.keymap.set("n", "<C-W><C-F>", ":split <cfile><CR>", { desc = "Split a file that does not exist" })
vim.cmd([[
    nmap <LocalLeader>h 0/http<CR>"ayW:silent exec "!xdg-open\ '<C-R>a'"<CR>:redraw!<CR>
]])

vim.keymap.set('n', '<Leader>e', function()
    local file = vim.api.nvim_buf_get_name(0)
    local path
    if file ~= '' then
        -- If there is a file, get its directory
        path = vim.fn.fnamemodify(file, ':h')
    else
        -- If no file, use current working directory
        path = vim.fn.getcwd()
    end
    require('mini.files').open(path)
end, { desc = 'Open MiniFiles at current file or cwd' })

vim.keymap.set("n", "<Leader>qq", ":wqa<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<Leader>qq", ":wqa<CR>", { desc = "Write and quit" })
vim.keymap.set('n', '<Leader>fx', function()
    -- Get the directory containing your init.lua/init.vim
    local config_dir = vim.fn.fnamemodify(vim.env.MYVIMRC, ':h')
    -- Open MiniFiles at that directory
    require('mini.files').open(config_dir)
end, { desc = 'Open MiniFiles at config folder' })
