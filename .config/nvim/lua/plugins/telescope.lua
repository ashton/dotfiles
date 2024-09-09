local function config()
  local actions = require 'telescope/actions'

  require "telescope".setup {
    defaults = {
      file_ignore_patterns = { '.git', 'node_modules', '__pycache__' },
      dynamic_preview_title = true,
      mappings = {
        n = {
          ['<ESC>'] = actions.close,
          ['v'] = actions.file_vsplit,
          ['s'] = actions.file_split,
        }
      },
    },
    pickers = {
      find_files = {
        prompt_prefix = "󰍉 ",
        theme = "ivy",
      },
      live_grep = {
        theme = "ivy",
      },
      lsp_workspace_symbols = {
        theme = "ivy",
      },
      lsp_document_symbols = {
        theme = "ivy",
      },
      luasnip = {
        theme = "ivy",
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    }
  }

  require('telescope').load_extension('luasnip')
  require('telescope').load_extension('fzf')
  require("telescope").load_extension("yank_history")
end

return { config = config }
