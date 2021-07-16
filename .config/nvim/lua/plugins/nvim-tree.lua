vim.g.nvim_tree_ignore = {".pyc", "node_modules", "build", "dist", ".git", "tags", "target", ".bs.js"}
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_autoclose = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_git_hl = 1

vim.g.nvim_tree_show_icons = {
  git = 0,
  files = 1,
  folders = 1,
  folder_arrows = 1
}

vim.api.nvim_command("hi NvimTreeGitNew guifg=#9DA3B1")
vim.api.nvim_command("hi NvimTreeGitDirty guifg=#FAC863")
vim.api.nvim_command("hi NvimTreeGitStaged guifg=#5FB3B3")
