local function setup(opts)
  for opt, value in pairs(opts) do
    if type(value) == "boolean" then
      value = value and 1 or 0
    end
    vim.g["nvim_tree_" .. opt] = value
  end
end

setup {
  ignore = {".pyc", "node_modules", "build", "dist", ".git", "tags", "target", ".bs.js"},
  gitignore = true,
  autoclose = true,
  quit_on_open = true,
  git_hl = true,
  show_icons = {
    git = 0,
    files = 1,
    folders = 1,
    folder_arrows = 1
  }
}

vim.api.nvim_command("hi NvimTreeGitNew guifg=#9DA3B1")
vim.api.nvim_command("hi NvimTreeGitDirty guifg=#FAC863")
vim.api.nvim_command("hi NvimTreeGitStaged guifg=#5FB3B3")
