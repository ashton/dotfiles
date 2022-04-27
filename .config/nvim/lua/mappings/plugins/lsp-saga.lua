local leader_mappings = {
  c = {
    name = "+code",
    a = {"<Cmd>Lspsaga code_action<CR>", "code action"},
    d = {"<Cmd>lua vim.lsp.buf.definition()<CR>", "go to definition"},
    D = {"<Cmd>Trouble lsp_references<CR>", "find references"},
    h = {"<Cmd>Lspsaga hover_doc<CR>", "documentation"},
    p = {"<Cmd>Lspsaga preview_definition<CR>", "preview definition"},
    r = {"<Cmd>Lspsaga rename<CR>", "rename symbol"},
    x = {"<Cmd>Lspsaga show_line_diagnostics<cr>", "line diagnostics"},
    X = {"<Cmd>Trouble document_diagnostics<CR>", "workspace diagnostics"}
  }
}

local goto_mappings = {
  name = "+goto",
  d = {"<Cmd>lua vim.lsp.buf.definition()<CR>", "go to definition"},
  D = {"<Cmd>Trouble lsp_references<CR>", "find references"}
}

local next_mappings = {
  name = "+next",
  e = {"<Cmd>Lspsaga diagnostic_jump_next<cr>", "next diagnostic"}
}

local prev_mappings = {
  name = "+previous",
  e = {"<Cmd>Lspsaga diagnostic_jump_prev<cr>", "previous diagnostic"}
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
