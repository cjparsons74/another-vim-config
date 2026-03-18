return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"benfowler/telescope-luasnip.nvim", -- Adding the Telescope extension
		},
		config = function()
			local ls = require("luasnip")
			local s = ls.snippet
			local i = ls.insert_node
			local fmt = require("luasnip.extras.fmt").fmt

			-- Define the snippets for HTML
			ls.add_snippets("html", {
				-- 1. BASE SKELETON
				s(
					"news-base",
					fmt(
						[[
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <style>
        body {{ margin: 0; padding: 0 !important; background-color: #faf6f1; }}
        table, td {{ border-collapse: collapse; }}
        p {{ margin: 0; padding: 0; margin-bottom: 1em; }}
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700" rel="stylesheet">
</head>
<body width="100%" style="margin: 0; padding: 0 !important; background-color: #faf6f1">
    <center style="width: 100%; background-color: #faf6f1">
        <div style="display: none; max-height: 0px; overflow: hidden;">{}</div>
        <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px; margin: auto">
            <tr>
                <td><img src="https://www.bethesdachildren.org/static/newsletter/Header600.png" width="600" style="width: 100%; height: auto"></td>
            </tr>
            {}
        </table>
    </center>
</body>
</html>
            ]],
						{ i(1, "News from the Metty home"), i(0) }
					)
				),

				-- 2. IMAGE + TEXT ROW
				s(
					"news-img-txt",
					fmt(
						[[
                <tr>
                    <td style="padding: 10px; background-color: #ffffff; text-align: center; font-size: 0">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 350px; display: inline-block; vertical-align: middle; text-align: left">
                            <tr>
                                <td style="font-family: Nunito, sans-serif; padding: 10px;">
                                    <h4 style="margin: 0;">{}</h4>
                                    <p style="margin: 0;">{}</p>
                                </td>
                            </tr>
                        </table>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 180px; display: inline-block; vertical-align: middle;">
                            <tr>
                                <td style="padding: 10px;">
                                    <img alt="{}" src="{}" width="160" style="width: 100%; border-radius: 10px;">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            ]],
						{ i(1, "Headline"), i(2, "Content"), i(3, "Alt Text"), i(4, "URL") }
					)
				),

				-- 3. TEXT ONLY ROW
				s(
					"news-txt",
					fmt(
						[[
                <tr>
                    <td style="padding: 15px 30px; font-family: Nunito, sans-serif; background-color: #ffffff;">
                        <h4>{}</h4>
                        <p>{}</p>
                    </td>
                </tr>
            ]],
						{ i(1, "Headline"), i(2, "Content") }
					)
				),

				-- 4. GREEN CTA BOX
				s(
					"news-cta",
					fmt(
						[[
                <tr>
                    <td style="padding: 20px; background-color: #ffffff;">
                        <table width="100%" style="background-color: #22c55e; border-radius: 8px; color: #ffffff;">
                            <tr>
                                <td style="padding: 20px; font-family: Nunito, sans-serif;">
                                    <p style="margin: 0;">{} <a href="{}" style="color: #ffffff; text-decoration: underline;">{}</a></p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            ]],
						{ i(1, "Message"), i(2, "URL"), i(3, "Link Text") }
					)
				),
			})

			-- Load Telescope extension if you have telescope installed
			pcall(require("telescope").load_extension, "luasnip")

			-- Keymaps for jumping
			vim.keymap.set({ "i", "s" }, "<Tab>", function()
				local cmp = require("cmp")

				if cmp.visible() then
					-- If the menu is open, confirm the selection
					cmp.confirm({ select = true })
				elseif ls.expand_or_jumpable() then
					-- If we are in a snippet, JUMP
					ls.expand_or_jump()
				else
					-- Otherwise, just be a normal Tab key
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })
		end,
	},
}
