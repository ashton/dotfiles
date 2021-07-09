require 'nvim_utils'

local mappings = {
  ['n<leader>fp'] = {':Telescope find_files<CR>', silent = true, noremap = true},
  ['n<leader>sp'] = {':Telescope live_grep<CR>', silent = true, noremap = true},
  ['n<leader>bb'] = {':Telescope buffers<CR>', silent = true, noremap = true},
}

nvim_apply_mappings(mappings)
