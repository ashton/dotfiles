local util = require "lspconfig/util"
local lspconfig = require "lspconfig"
local lspinstall = require "lspinstall"
local saga = require "lspsaga"

local function make_config()
  local cmp = require "cmp_nvim_lsp"
  --Enable (broadcasting) snippet capability for completion
  local capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
  }

  return {capabilities = capabilities}
end

local function setup_servers()
  local installed_servers = lspinstall.installed_servers()
  local required_servers = {
    "elm",
    "lua",
    "typescript"
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

local config = make_config()
config.cmd = {
  "node",
  "/Users/matheus.ashton/.local/share/nvim/site/pack/packer/start/vim-rescript/server/out/server.js",
  "--stdio"
}

lspconfig.rescriptls.setup(config)

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

local signs = {Error = " ", Warning = " ", Hint = " ", Information = " "}

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

saga.init_lsp_saga(
  {
    error_sign = "",
    warn_sign = "",
    infor_sign = "",
    hint_sign = "",
    code_action_icon = "",
    code_action_prompt = {enable = false},
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = true
    }
  }
)
