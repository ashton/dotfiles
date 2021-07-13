require 'nvim_utils'

local mappings = {
  ['n<leader>ca'] = {':Lspsaga code_action<CR>', silent = true, noremap = true},
  ['v<leader>ca'] = {':<C-U>Lspsaga range_code_action<CR>', silent = true, noremap = true},
  ['n<leader>cd'] = {'<Cmd>lua vim.lsp.buf.definition()<CR>', silent = true, noremap = true},
  ['n<leader>cp'] = {':Lspsaga preview_definition<CR>', silent = true, noremap = true},
  ['n<leader>cD'] = {':LspTrouble lsp_references', silent = true, noremap = true},
  ['n<leader>ck'] = {':Lspsaga hover_doc<CR>', silent = true, noremap = true},
  ['n<leader>cr'] = {':Lspsaga rename<CR>', silent = true, noremap = true},
  ['n<leader>cx'] = {':LspTrouble lsp_workspace_diagnostics', silent = true, noremap = true},
  ['n<C-f>'] = {[[<Cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>]], silent = true, noremap = true},
  ['n<C-b>'] = {[[<Cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>]], silent = true, noremap = true}
}

nvim_apply_mappings(mappings)
