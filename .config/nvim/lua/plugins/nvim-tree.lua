local ntree = require "nvim-tree"
local tree_cb = require "nvim-tree.config".nvim_tree_callback
local function vim_global_config_setup(opts)
  for opt, value in pairs(opts) do
    if type(value) == "boolean" then
      value = value and 1 or 0
    end
    vim.g["nvim_tree_" .. opt] = value
  end
end

ntree.setup {
  auto_close = true,
  hijack_cursor = true,
  update_focused_file = {
    enable = true
  },
  diagnostics = {
    enable = true
  },
  git = {
    enable = true,
    ignore = true,
    timout = 500
  },
  view = {
    mappings = {
      list = {
        {key = "v", cb = tree_cb("vsplit")},
        {key = "s", cb = tree_cb("split")},
        {key = "cf", cb = tree_cb("create")}
      }
    }
  }
}

vim_global_config_setup {
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
