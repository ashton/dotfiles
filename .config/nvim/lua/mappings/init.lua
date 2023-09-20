local wk = require "which-key"
local plugin_mappings = require "mappings/plugins"
local global_mappings = require "mappings/global"

vim.g.mapleader = " "

local mappings = vim.tbl_deep_extend(
  "force",
  global_mappings,
  plugin_mappings
)

for k, v in pairs(mappings) do
  wk.register(v, {prefix = k, silent = true, noremap = true})
end

vim.api.nvim_set_keymap("n", "<ESC><ESC>", ":nohlsearch<CR>", {desc="clear highlight", silent = true, noremap = true, nowait=true})
vim.api.nvim_set_keymap("n", "<S-Right>", ":vertical resize +5<CR>", {desc="resize window vertically +5", silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<S-Left>", ":vertical resize -5<CR>", {desc="resize window vertically -5",silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<S-Up>", ":resize +5<CR>", {desc="resize window horizontally +5", silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<S-Down>", ":resize -5<CR>", {desc="resize window horizontally -5", silent = true, noremap = true})
