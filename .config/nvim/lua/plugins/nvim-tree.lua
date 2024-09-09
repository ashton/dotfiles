local function custom_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Horizontal Split'))
  vim.keymap.set('n', 'cf', api.fs.create, opts('Create Node'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

vim.api.nvim_command("hi NvimTreeGitNew guifg=#9DA3B1")
vim.api.nvim_command("hi NvimTreeGitDirty guifg=#FAC863")
vim.api.nvim_command("hi NvimTreeGitStaged guifg=#5FB3B3")

return {
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  on_attach = custom_attach,
  hijack_cursor = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true
  },
  git = {
    timeout = 500
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  },
  renderer = {
    icons = {
      show = {
        git = false,
      }
    }
  }
}
