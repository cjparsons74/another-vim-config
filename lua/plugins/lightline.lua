return  { "itchyny/lightline.vim",
dependencies = {"fenetikm/falcon"},
init = function()
    vim.cmd [[
    ]]
    end,
config = function()
    vim.cmd [[
    colorscheme falcon
    let g:lightline =  { 'colorscheme': 'falcon' }
    ]]
end
}

