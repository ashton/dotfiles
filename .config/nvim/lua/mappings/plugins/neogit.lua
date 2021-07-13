require 'nvim_utils'

local mappings = {
  ['n<leader>gg'] = {':Neogit<CR>', silent = true, noremap = true}
}

nvim_apply_mappings(mappings)
