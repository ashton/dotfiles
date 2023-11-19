local lsp = require('lsp-zero').preset({
  manage_nvim_cmp = {
    set_sources = "recommended",
    set_extra_mappings = true,
  }
})

lsp.on_attach(function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    require "lsp-format".on_attach(client, bufnr)
  end

  if client.server_capabilities.documentSymbolProvider then
    require "nvim-navic".attach(client, bufnr)
  end
end)

lsp.ensure_installed({
  "bashls",
  "html",
  "jsonls",
  "elmls",
  "rescript-language-server",
  "lua_ls",
  --  "ocamllsp",
  "tsserver",
  --  "hls",
  "rust_analyzer",
  "svelte",
  "elixirls",
  "nextls",
  "yamlls"
})

lsp.set_sign_icons({
  error = "󰅙",
  warn = "",
  hint = "󰭻",
  info = "󰋼"
})

lsp.setup()

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      scope = 'line',
    }
    vim.diagnostic.open_float(opts)
  end
})

require "plugins/nvim-cmp"
