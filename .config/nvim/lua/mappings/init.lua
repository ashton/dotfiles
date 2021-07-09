require 'nvim_utils'
vim.g.mapleader = ' '

local mappings = {
  -- search
  ['n<leader>hc'] = {':nohlsearch<CR>', silent = true, noremap = true},
  ['n<ESC><ESC>'] = {':nohlsearch<CR>', silent = true, noremap = true},

  -- buffers

  -- windows
  ['n<leader>wj'] = {'<C-W><C-J>', noremap = true},
  ['n<leader>wk'] = {'<C-W><C-K>', noremap = true},
  ['n<leader>wl'] = {'<C-W><C-L>', noremap = true},
  ['n<leader>wh'] = {'<C-W><C-H>', noremap = true},
  ['n<leader>wd'] = {'<C-W>q', noremap = true},

  -- resize panes
  ['n<S-Right>'] = {':vertical resize +5<CR>', silent = true, noremap = true},
  ['n<S-Left>'] = {':vertical resize -5<CR>', silent = true, noremap = true},
  ['n<S-Up>'] = {':resize +5<CR>', silent = true, noremap = true},
  ['n<S-Down>'] = {':resize -5<CR>', silent = true, noremap = true},
}

nvim_apply_mappings(mappings)

require 'mappings/plugins'
