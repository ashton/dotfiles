require 'nvim_utils'

local mappings = {
  ['n<leader>op'] = {':NvimTreeToggle<CR>', silent = true, noremap = true},
  ['n\\'] = {':NvimTreeToggle<CR>', silent = true, noremap = true},
  ['n<leader>oP'] = {':NvimTreeFindFile<CR>', silent = true, noremap = true},
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  { key = 'v', cb = tree_cb('vsplit') },
  { key = 's', cb = tree_cb('split') },
  { key = 'cf', cb = tree_cb('create') },
}

nvim_apply_mappings(mappings)
