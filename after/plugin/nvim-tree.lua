local wk = require("which-key")
local nt = require("nvim-tree")
nt.setup()
local nta = require("nvim-tree.api")
wk.register({
      e = { "<cmd>NvimTreeFindFileToggle!<cr>", "Explore" },
}, { prefix = "<leader>" })
