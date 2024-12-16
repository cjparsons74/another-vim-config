return {
    "cjparsons74/lightline.vim",
    dependencies = { "cjparsons74/falcon" },
    -- dir = "~/Projects/lightline.vim",
    config = function()
        vim.cmd([[
    let g:lightline =  {
    \ 'colorscheme': 'falconish',
    "\ 'active': {
    "\ 'right': [ ['yaml_path'] ]
    "\   },
    "\ 'component_function': {
    "\   'yaml_path': 'YAMLView'
    "\ },
    \ }
    colorscheme falcon
    ]])
    end,
}
