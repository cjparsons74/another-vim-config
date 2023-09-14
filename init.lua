print("hello new config")
vim.g.mapleader = ' '

require("lazy_bootstrap")

require("lazy").setup("plugins")
require('telescope').load_extension('fzy_native')
require("keys")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.cmd("colorscheme falcon")

