require 'nvim-treesitter.configs'.setup {
  ensure_installed = {'dart', 'elixir', 'elm', 'graphql', 'html', 'javascript', 'json', 'lua', 'python', 'regex', 'rust', 'svelte', 'tsx', 'typescript', 'vue', 'yaml'}
  highlight = {
    enable = true,
  }
}
