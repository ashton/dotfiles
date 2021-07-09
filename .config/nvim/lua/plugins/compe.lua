local compe = require 'compe'

vim.o.completeopt = 'menuone,noselect'

compe.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',

  source = {
    path = true;
    buffer = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- vsnip = true;
    -- ultisnips = true;
    -- luasnip = true;
  };
}
