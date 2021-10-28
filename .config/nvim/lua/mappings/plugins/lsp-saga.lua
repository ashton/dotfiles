local leader_mappings = {
  c = {
    name = "+code",
    a = {"<cmd>Lspsaga code_action<CR>", "code action"},
    d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "go to definition"},
    D = {"<cmd>LspTrouble lsp_references", "find references"},
    h = {"<cmd>Lspsaga hover_doc<CR>", "documentation"},
    p = {"<cmd>Lspsaga preview_definition<CR>", "preview definition"},
    r = {"<cmd>Lspsaga rename<CR>", "rename symbol"},
    x = {"<cmd>Lspsaga show_line_diagnosticts<CR>"},
    X = {"<cmd>LspTrouble lsp_workspace_diagnostics<CR>", "workspace diagnostics"}
  }
}

local goto_mappings = {
  name = "+goto",
  d = {"<Cmd>lua vim.lsp.buf.definition()<CR>", "go to definition"},
  D = {"<Cmd>LspTrouble lsp_references", "find references"}
}

local next_mappings = {
  name = "+next",
  e = {[[<Cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], "next diagnostic"}
}

local prev_mappings = {
  name = "+previous",
  e = {[[<Cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], "previous diagnostic"}
}

vim.api.nvim_set_keymap("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap(
  "v",
  "<C-f>",
  [[<Cmd>lua require('lspsaga.hover').smart_scroll_hover(1)<CR>]],
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap(
  "v",
  "<C-b>",
  [[<Cmd>lua require('lspsaga.hover').smart_scroll_hover(-1)<CR>]],
  {silent = true, noremap = true}
)

return {
  ["<leader>"] = leader_mappings,
  ["["] = prev_mappings,
  ["]"] = next_mappings,
  g = goto_mappings
}
