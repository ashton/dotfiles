local util = require 'lspconfig/util'
local lspconfig = require 'lspconfig'
local lspinstall = require 'lspinstall'
local saga = require 'lspsaga'

local function on_attach(client, bufnr)
  require'lsp_signature'.on_attach()
end

local function make_config()
  --Enable (broadcasting) snippet capability for completion
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'},
  }

  return {on_attach = on_attach, capabilities = capabilities}
end

local function setup_servers()
  local installed_servers = lspinstall.installed_servers()
  local required_servers = {
    'elm',
    'lua',
    'typescript'
  }

  for _, server in pairs(required_servers) do
    if not vim.tbl_contains(installed_servers, server) then
      lspinstall.install_server(server)
    end
  end

  lspinstall.setup()
  installed_servers = lspinstall.installed_servers()

  for _, server in pairs(installed_servers) do
    local config = make_config()
    lspconfig[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

saga.init_lsp_saga({
  error_sign = '',
  warn_sign = '',
  infor_sign = '',
  hint_sign = '',
  code_action_icon = ' ',
  code_action_prompt = {enable = false},
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
})
