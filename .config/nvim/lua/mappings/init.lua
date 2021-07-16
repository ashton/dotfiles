local utils = require 'utils'
local wk = require 'whichkey_setup'
local plugin_mappings = require 'mappings/plugins'

vim.g.mapleader = ' '

local global_mappings = {
  ['leader'] = {
    w = {
      name = '+windows',
      j = {'<C-W><C-J>', 'go to window below'},
      k = {'<C-W><C-K>', 'go to window above'},
      l = {'<C-W><C-L>', 'go to window at right'},
      h = {'<C-W><C-H>', 'go to window at left'},
      d = {'<C-W>q', 'delete window'},
    },
    s = {
      name = '+search',
      h = {':nohlsearch<CR>', 'clear search highlight'},
    },
  },
}

local mappings = utils.merge_tables(global_mappings, plugin_mappings)

for k, v in pairs(mappings) do
  wk.register_keymap(k, v, {silent = true, noremap = true})
end


vim.api.nvim_set_keymap('n', '<ESC><ESC>',':nohlsearch<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<S-Right>',':vertical resize +5<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<S-Left>',':vertical resize -5<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<S-Up>',':resize +5<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<S-Down>',':resize -5<CR>', {silent = true, noremap = true})
