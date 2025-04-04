return {
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'dart',
        'elixir',
        'heex',
        'eex',
        'elm',
        'graphql',
        'html',
        'javascript',
        'json',
        'markdown',
        'markdown_inline',
        'lua',
        'python',
        'regex',
        'rust',
        'svelte',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'yaml',
        'dap_repl'
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
    }
  },
  {
    "nkrkv/nvim-treesitter-rescript",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      }
    }
  },
}
