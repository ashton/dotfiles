require 'nvim_utils'

local mappings = {
  ['n<leader>ca'] = {':Lspsaga code_action<CR>', silent = true, noremap = true},
  ['v<leader>ca'] = {':<C-U>Lspsaga range_code_action<CR>', silent = true, noremap = true},
  ['n<leader>ck'] = {':Lspsaga hover_doc<CR>', silent = true, noremap = true},
  ['n<leader>cr'] = {':Lspsaga rename<CR>', silent = true, noremap = true},
  ['n<leader>cd'] = {':Lspsaga preview_definition<CR>', silent = true, noremap = true},
  ['n<leader>cr'] = {':Trouble lsp_references', silent = true, noremap = true},
  ['n<leader>cx'] = {':Trouble lsp_workspace_diagnostics', silent = true, noremap = true}
}

nvim_apply_mappings(mappings)
