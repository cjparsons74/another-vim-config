require("options")

require("lazy_bootstrap")

require("lazy").setup("plugins")
require("lsp")
require("keys")
require("set")

-- Had problems with OSC52 integration. This will make it falback to xsel
vim.g.clipboard = false
