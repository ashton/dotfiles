local ntree = require "nvim-tree"
local tree_cb = require "nvim-tree.config".nvim_tree_callback

ntree.setup {
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
    timeout = 500
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  view = {
    mappings = {
      list = {
        {key = "v", cb = tree_cb("vsplit")},
        {key = "s", cb = tree_cb("split")},
        {key = "cf", cb = tree_cb("create")}
      }
    }
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        git = false,
        folder_arrow = true
      }
    }
  }
}

vim.api.nvim_command("hi NvimTreeGitNew guifg=#9DA3B1")
vim.api.nvim_command("hi NvimTreeGitDirty guifg=#FAC863")
vim.api.nvim_command("hi NvimTreeGitStaged guifg=#5FB3B3")
