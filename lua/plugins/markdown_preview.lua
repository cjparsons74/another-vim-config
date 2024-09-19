return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		vim.cmd([[
	let $NVIM_MKDP_LOG_FILE = expand('~/mkdp-log.log')
	let $NVIM_MKDP_LOG_LEVEL = 'debug'
	]])
	end,
}
