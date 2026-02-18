return {
    "cjparsons74/todo.txt-vim",
    config = function()
        vim.cmd([[
let g:TodoTxtStripDoneItemPriority=1
let g:Todo_txt_prefix_creation_date=1

augroup todo_filetype
        autocmd!
        au FileType todo setlocal nowrap  | nmap <LocalLeader>o 0/\|<CR>l"ay/\|<CR>:silent exec "!xdg-open\ https://pennyworth.atlassian.net/browse/<C-R>a"<CR>:redraw!<CR> au FileType todo nmap <LocalLeader>,i A +isp<ESC>0 | nmap <LocalLeader>,m A +management<ESC>0| nmap <LocalLeader>,w A +wings<ESC>0
        au FileType todo nmap <LocalLeader>q yyp/[A-Za-z]\{2}<CR>i(partial) <Esc><C-L>0cWx <C-R>=strftime("%Y-%m-%d")<CR><Esc>k:s/([ABC])/(C)/<CR>0/\d\{4}<CR>cW<C-R>=strftime("%Y-%m-%d")<CR><Esc>
        au FileType todo setlocal nospell | setlocal foldlevel=3

        " First sort is needed in case a completed item 'x' causes break of Filter early
        au BufWritePre ~/Todo/todo.txt sort|call todo#FilterPastFuture()|sort
        au BufRead ~/Todo/todo.txt call todo#FilterPastFuture()|sort

        au! BufWritePost ~/Todo/todo.txt !$HOME/Todo/todo.sh jira
        "au! BufWritePost ~/todo.txt !~/Todo/todo.sh
    ab ~d ~/Documents/<C-r>=strftime("%F%-H%I%M")<CR>.txt
augroup END
]])
    end,
}
