function config()
  local lsp = require('lsp-zero')
  lsp.extend_lspconfig()


  lsp.on_attach(function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      require "lsp-format".on_attach(client, bufnr)
    end

    if client.server_capabilities.documentSymbolProvider then
      require "nvim-navic".attach(client, bufnr)
    end

    if client.server_capabilities.codeLens then
      local codelens = vim.api.nvim_create_augroup(
        'LSPCodeLens',
        { clear = true }
      )
      vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
        group = codelens,
        callback = function()
          vim.lsp.codelens.refresh()
        end,
        buffer = bufnr,
      })
    end
  end)

  lsp.set_sign_icons({
    error = "󰅙",
    warn = "",
    hint = "󰭻",
    info = "󰋼"
  })

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

  vim.api.nvim_create_autocmd(
    "FileType", {
      pattern = { "qf" },
      command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]]
    }
  )

  require('plugins/mason-lspconfig').config(lsp)
end

return { config = config }
