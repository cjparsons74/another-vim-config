vim.opt.guicursor = ""


vim.opt.relativenumber = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.tildeop = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")

vim.opt.spellfile = os.getenv("HOME") .. "/.vim/spell/en.utf-8.add"
vim.opt.spelllang = "en_gb"
vim.opt.updatetime = 50

vim.opt.shada = "!,'5000,<500,s10,h"

-- Prevent passing mouse to vim when ssh
vim.opt.mouse = ""

-- Don't need "Insert" in below airline because airline has it
vim.opt.showmode = false
vim.cmd([[
augroup asciidoc_filetype
        autocmd!
        au FileType asciidoc,text set spell | set formatoptions=tcqv | set textwidth=100 | set formatexpr=
augroup END

set diffopt+=context:1
"au DiffUpdated * colorscheme murphy
au BufEnter * if &diff | set wrap | set nospell | endif
]])
