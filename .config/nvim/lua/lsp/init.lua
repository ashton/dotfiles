local util = require "lspconfig/util"
local lspconfig = require "lspconfig"
local lsp_installer = require("nvim-lsp-installer")
local lsp_installer_servers = require("nvim-lsp-installer.servers")
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
  local required_servers = {
    "elmls",
    "sumneko_lua",
    "tsserver",
    "hls"
  }

  for _, server in pairs(required_servers) do
    lspconfig[server].setup(make_config())

    local server_available, requested_server = lsp_installer_servers.get_server(server)
    if server_available then
      if not requested_server:is_installed() then
        -- Queue the server to be installed
        requested_server:install()
      end

      requested_server:on_ready(
        function()
          requested_server:setup(make_config())
        end
      )
    end
  end
end

-- until lsp_installer supports it
local function setup_rescript()
  local config = make_config()
  config.cmd = {
    "node",
    "/Users/matheus.ashton/.local/share/nvim/site/pack/packer/start/vim-rescript/server/out/server.js",
    "--stdio"
  }
  lspconfig.rescriptls.setup(config)
end

setup_servers()
setup_rescript()

local signs = {Error = " ", Warning = " ", Hint = " ", Information = " "}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

saga.init_lsp_saga(
  {
    error_sign = "",
    warn_sign = "",
    infor_sign = "",
    hint_sign = "",
    code_action_icon = "",
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = true
    }
  }
)
