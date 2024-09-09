local function config()
  local a = 2
  require 'nvim-treesitter.configs'.setup {
    auto_install = true,
    ensure_installed = { 'bash', 'c', 'dart', 'elixir', 'elm', 'graphql', 'html', 'javascript', 'json', 'markdown', 'markdown_inline', 'lua', 'python', 'regex', 'rust', 'svelte', 'tsx', 'typescript', 'vim', 'vimdoc', 'vue', 'yaml', 'dap_repl' },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true
    },

    -- textobjects = {
    --   select = {
    --     enable = true,
    --     keymaps = {
    --       ["af"] = "@function.outer",
    --       ["if"] = "@function.inner",
    --       ["ac"] = "@call.outer",
    --       ["ic"] = "@call.inner",
    --       ["ap"] = "@parameter.outer",
    --       ["ip"] = "@parameter.inner",
    --       ["ia"] = "@identifier.inner",
    --       ["aa"] = "@identifier.outer",
    --       ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
    --     },
    --     selection_modes = {
    --       ["@function.outer"] = 'V',
    --       ["@function.inner"] = 'V'
    --     }
    --   },
    --   move = {
    --     enable = true,
    --     set_jumps = true,
    --     goto_next = {
    --       ["]f"] = "@function.outer",
    --       ["],"] = "@parameter.outer",
    --       ["]a"] = "@identifier.outer",
    --       ["]s"] = { query = "@scope", query_group = "locals", desc = "go to next scope" }
    --     },
    --     goto_previous = {
    --       ["[f"] = "@function.outer",
    --       ["[a"] = "@identifier.outer",
    --       ["]s"] = { query = "@scope", query_group = "locals", desc = "go to next scope" }
    --     }
    --   }
    -- }

  }
end

return { config = config }
