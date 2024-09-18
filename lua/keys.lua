-- Other mappings are in telescope.lua etc. that use Which Key
vim.keymap.set("n", "<C-p>", "<cmd>cprev<cr>", { desc = "Quickfix prev" })
vim.keymap.set("n", "<C-n>", "<cmd>cnext<cr>", { desc = "Quickfix next" })
vim.keymap.set("n", "<Del>", "<Esc>", { desc = "Do not delete in normal mode" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Alternate Esc" })
vim.keymap.set("n", "gf", ":e <cfile><CR>", { desc = "Open a file that does not exist" })
vim.keymap.set("n", "<C-W><C-F>", ":split <cfile><CR>", { desc = "Split a file that does not exist" })

local wk = require("which-key")
wk.register({
	q = {
		name = "session",
		q = { ":wqa<CR>", "Writeall quit" },
	},
}, { prefix = "<leader>" })

vim.cmd([[
    nnoremap Q :call ToggleColmak()<CR>
    let g:colmak_toggle = 1

    function! ToggleColmak()
      if g:colmak_toggle == 1
          nnoremap n j
          nnoremap e k
          nnoremap k n
     else
          nunmap n j
          nunmap e k
          nunmap k n
    endif
    endfunction
    ]])
