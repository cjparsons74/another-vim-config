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

vim.keymap.set("n", "<Leader>e", function()
	local file = vim.api.nvim_buf_get_name(0)
	local path
	if file ~= "" then
		-- If there is a file, get its directory
		path = vim.fn.fnamemodify(file, ":h")
	else
		-- If no file, use current working directory
		path = vim.fn.getcwd()
	end
	require("mini.files").open(path)
end, { desc = "Open MiniFiles at current file or cwd" })

vim.keymap.set("n", "<Leader>qq", ":wqa<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<Leader>qq", ":wqa<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<Leader>fx", function()
	-- Get the directory containing your init.lua/init.vim
	local config_dir = vim.fn.fnamemodify(vim.env.MYVIMRC, ":h")
	-- Open MiniFiles at that directory
	require("mini.files").open(config_dir)
end, { desc = "Open MiniFiles at config folder" })

vim.g.nvim_surround_no_mappings = true
local map = vim.keymap.set

map("n", "<leader>sa", "<Plug>(nvim-surround-normal)", {
	desc = "Add surround",
})

map("n", "<leader>sd", "<Plug>(nvim-surround-delete)", {
	desc = "Delete surround",
})

map("n", "<leader>sc", "<Plug>(nvim-surround-change)", {
	desc = "Change surround",
})

map("n", "<leader>sf", "<Plug>(nvim-surround-find)", {
	desc = "Find surround",
})

map("n", "<leader>sh", "<Plug>(nvim-surround-highlight)", {
	desc = "Highlight surround",
})

vim.keymap.set("n", "<leader>si", function()
	vim.cmd("normal! vib")
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(nvim-surround-visual)", true, false, true), "m", false)
end, { desc = "Surround inside container" })

vim.keymap.set("n", "<leader>so", function()
	vim.cmd("normal! vab")
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(nvim-surround-visual)", true, false, true), "m", false)
end, { desc = "Surround outside container" })

vim.keymap.set("n", "<leader>sp", function()
	vim.cmd("normal! vip")
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(nvim-surround-visual)", true, false, true), "m", false)
end, { desc = "Surround inside paragraph" })

local wk = require("which-key")

wk.add({
	{ "<leader>s", group = "Surround" },
})

map("v", "<leader>sa", "<Plug>(nvim-surround-visual)", {
	desc = "Add surround (visual)",
})
map("n", "<leader>ss", function()
	require("telescope.builtin").keymaps({
		mode = "n",
	})
end, { desc = "Search surround keymaps" })
