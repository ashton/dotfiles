local leader_mappings = {
  o = {
    name = "+open",
    p = {"<cmd>NvimTreeToggle<CR>", "open file tree"},
    P = {"<cmd>NvimTreeFindFile<CR>", "find file in file tree"}
  }
}

vim.api.nvim_set_keymap("n", "\\", ":NvimTreeToggle<CR>", { desc= "toggle file explorer",silent = true, noremap = true})

return {["<leader>"] = leader_mappings}
