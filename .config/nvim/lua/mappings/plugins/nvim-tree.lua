local leader_mappings = {
  o = {
    name = "+open",
    p = {"<cmd>NvimTreeToggle<CR>", "open file tree"},
    P = {"<cmd>NvimTreeFindFile<CR>", "find file in file tree"}
  }
}

vim.api.nvim_set_keymap("n", "\\", ":NvimTreeToggle<CR>", {silent = true, noremap = true})

local tree_cb = require "nvim-tree.config".nvim_tree_callback
vim.g.nvim_tree_bindings = {
  {key = "v", cb = tree_cb("vsplit")},
  {key = "s", cb = tree_cb("split")},
  {key = "cf", cb = tree_cb("create")}
}

return {["<leader>"] = leader_mappings}
