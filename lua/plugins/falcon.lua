return	{ "fenetikm/falcon", name="falcon",
priority=100,
name="falcon",
lazy=false,
        config = function()
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.cmd [[
            let g:falcon_background = 0
            let g:falcon_inactive = 1
            colorscheme falcon
            ]]
        end
	}
