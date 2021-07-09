require 'nvim_utils'

local mappings = {
  ['n<leader>tn'] = {':TestNearest<CR>', silent = true, noremap=true},
  ['n<leader>tf'] = {':TestFile<CR>', silent = true, noremap=true},
  ['n<leader>ts'] = {':TestSuite<CR>', silent = true, noremap=true},
  ['n<leader>tl'] = {':TestLast<CR>', silent = true, noremap=true},
}

nvim_apply_mappings(mappings)
