return {
	"cjparsons74/lightline.vim",
	dependencies = { "fenetikm/falcon" },
	-- dir = "~/Projects/lightline.vim",
	config = function()
		vim.cmd([[
    let g:lightline =  { 'colorscheme': 'falconish' }
    colorscheme falcon
    ]])
	end,
}
