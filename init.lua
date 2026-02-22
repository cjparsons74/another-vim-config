vim.g.mapleader = " "
vim.g.maplocalleader = ","
_G.is_windows = vim.loop.os_uname().version:find("Windows") ~= nil
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"

-- Prepend Mason's bin to the PATH within Neovim only
if vim.fn.has("win32") == 1 then
    vim.env.PATH = mason_bin .. ";" .. vim.env.PATH
else
    vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
end

require("lazy_bootstrap")

require("lazy").setup("plugins")
require("lsp")
require("keys")
require("set")
require("gofmt")

-- Had problems with OSC52 integration. This will make it falback to xsel
vim.g.clipboard = false
