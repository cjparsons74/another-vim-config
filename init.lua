vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.cmp_enabled = 'true'
require("lazy_bootstrap")

require("lazy").setup("plugins")
require('telescope').load_extension('fzy_native')
require("keys")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.cmd("colorscheme falcon")

vim.cmd [[
set foldlevelstart=99
" Vim test
let test#python#pyunit#file_pattern = '\v((^|/)test.+\.py)|(.+_test\.py)' " the default is '\v(((^|/)test_.+)|_test)(spec)@<!\.rb$'

let g:TodoTxtStripDoneItemPriority=1
let g:Todo_txt_prefix_creation_date=1

" Needed for xdg-open to work
let $DISPLAY = ':1'

nmap <LocalLeader>h 0/http<CR>"ayW:silent exec "!xdg-open\ '<C-R>a'"<CR>:redraw!<CR>

augroup python_filetype
autocmd!
au BufWritePost *.py silent !black %
augroup END

augroup todo_filetype
        autocmd!
        au FileType todo setlocal nowrap  | nmap <LocalLeader>o 0/\|<CR>l"ay/\|<CR>:silent exec "!xdg-open\ https://pennyworth.atlassian.net/browse/<C-R>a"<CR>:redraw!<CR>
        au FileType todo nmap <LocalLeader>,i A +isp<ESC>0 | nmap <LocalLeader>,m A +management<ESC>0| nmap <LocalLeader>,w A +wings<ESC>0
        au FileType todo nmap <LocalLeader>q yyp/[A-Za-z]\{2}<CR>i(partial) <Esc><C-L>0cWx <C-R>=strftime("%Y-%m-%d")<CR><Esc>k:s/([ABC])/(C)/<CR>0/\d\{4}<CR>cW<C-R>=strftime("%Y-%m-%d")<CR><Esc>

        " First sort is needed in case a completed item 'x' causes break of Filter early
        au BufWritePre ~/todo.txt sort|call todo#FilterPastFuture()|sort
        au BufRead ~/todo.txt call todo#FilterPastFuture()|sort

        au! BufWritePost ~/todo.txt !$HOME/Todo/todo.sh jira
        "au! BufWritePost ~/todo.txt !~/Todo/todo.sh
    ab ~d ~/Documents/<C-r>=strftime("%F%-H%I%M")<CR>.txt
augroup END

let g:falcon_background = 0
let g:falcon_inactive = 1
]]
