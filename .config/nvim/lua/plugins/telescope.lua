local telescope = require 'telescope'
local actions = require 'telescope/actions'

return {
  defaults = {
    file_ignore_patterns = {'.git', 'node_modules', '__pycache__'},
    mappings = {
      n = {
        ['<ESC>'] = actions.close,
        ['v'] = actions.file_vsplit,
        ['s'] = actions.file_split,
      }
    }
  }
}
