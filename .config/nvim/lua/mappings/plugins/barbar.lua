require 'nvim_utils'

local mappings = {
  ['n]b'] = {':BufferNext<CR>', silent = true, noremap = true},
  ['n[b'] = {':BufferPrevious<CR>', silent = true, noremap = true},
  ['n<leader>b1'] = {':BufferGoto 1<CR>', silent = true, noremap = true},
  ['n<leader>b2'] = {':BufferGoto 2<CR>', silent = true, noremap = true},
  ['n<leader>b3'] = {':BufferGoto 3<CR>', silent = true, noremap = true},
  ['n<leader>b4'] = {':BufferGoto 4<CR>', silent = true, noremap = true},
  ['n<leader>b5'] = {':BufferGoto 5<CR>', silent = true, noremap = true},
  ['n<leader>b6'] = {':BufferGoto 6<CR>', silent = true, noremap = true},
  ['n<leader>b7'] = {':BufferGoto 7<CR>', silent = true, noremap = true},
  ['n<leader>b8'] = {':BufferGoto 8<CR>', silent = true, noremap = true},
  ['n<leader>b9'] = {':BufferGoto 9<CR>', silent = true, noremap = true},
  ['n<leader>b0'] = {':BufferGoto 10<CR>', silent = true, noremap = true},
  ['n<leader>bd'] = {':BufferClose<CR>', silent = true, noremap = true},
  ['n<leader>bo'] = {':BufferCloseAllButCurrent<CR>', silent = true, noremap = true},
}

nvim_apply_mappings(mappings)
