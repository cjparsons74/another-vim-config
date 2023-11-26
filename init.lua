vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.cmp_enabled = 'true'

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
require("lazy_bootstrap")
require("plugins")

require("lazy").setup("plugins")
require('telescope').load_extension('fzy_native')
require("nvim-web-devicons").setup()
require("nvim-tree").setup()

-- require('telescope').load_extension('file_browser')
require("keys")
require("set")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.cmd("colorscheme falcon")

vim.cmd [[
let g:falcon_background = 0
let g:falcon_inactive = 1
let g:falcon_lightline = 1
let g:lightline =  { 'colorscheme': 'falcon' }
colorscheme falcon"
set foldlevelstart=99

" Allow gf to open a file that doesn't exist yet
map gf :e <cfile><CR>
nmap <C-W><C-F> :split <cfile><CR>

" Alternate esc
imap jk <Esc>

" Vim test
let test#python#pyunit#file_pattern = '\v((^|/)test.+\.py)|(.+_test\.py)' " the default is '\v(((^|/)test_.+)|_test)(spec)@<!\.rb$'

let g:TodoTxtStripDoneItemPriority=1
let g:Todo_txt_prefix_creation_date=1

" Needed for xdg-open to work
let $DISPLAY = ':1'

" I don't want delete to delete in normal mode
nmap <Del> <Esc>

nmap <LocalLeader>h 0/http<CR>"ayW:silent exec "!xdg-open\ '<C-R>a'"<CR>:redraw!<CR>

augroup python_filetype
autocmd!
au BufWritePost *.py silent !black %
augroup END

augroup todo_filetype
        autocmd!
        au FileType todo setlocal nowrap  | nmap <LocalLeader>o 0/\|<CR>l"ay/\|<CR>:silent exec "!xdg-open\ https://pennyworth.atlassian.net/browse/<C-R>a"<CR>:redraw!<CR> au FileType todo nmap <LocalLeader>,i A +isp<ESC>0 | nmap <LocalLeader>,m A +management<ESC>0| nmap <LocalLeader>,w A +wings<ESC>0
        au FileType todo nmap <LocalLeader>q yyp/[A-Za-z]\{2}<CR>i(partial) <Esc><C-L>0cWx <C-R>=strftime("%Y-%m-%d")<CR><Esc>k:s/([ABC])/(C)/<CR>0/\d\{4}<CR>cW<C-R>=strftime("%Y-%m-%d")<CR><Esc>

        " First sort is needed in case a completed item 'x' causes break of Filter early
        au BufWritePre ~/todo.txt sort|call todo#FilterPastFuture()|sort
        au BufRead ~/todo.txt call todo#FilterPastFuture()|sort

        au! BufWritePost ~/todo.txt !$HOME/Todo/todo.sh jira
        "au! BufWritePost ~/todo.txt !~/Todo/todo.sh
    ab ~d ~/Documents/<C-r>=strftime("%F%-H%I%M")<CR>.txt
augroup END

]]
