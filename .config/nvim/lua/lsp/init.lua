local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lsp_format = require("lsp-format")

local default_servers = {
  "elmls",
  "lua_ls",
  "tsserver",
  --  "hls",
  "rust_analyzer",
  "svelte",
  "elixirls"
}

mason.setup()
mason_lspconfig.setup {
  ensure_installed = default_servers,
  automatic_installation = true
}
lsp_format.setup {}

local lspconfig = require "lspconfig"

local function make_config()
  local cmp = require "cmp_nvim_lsp"
  --Enable (broadcasting) snippet capability for completion
  local capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
  }

  on_attach = lsp_format.on_attach

  return {capabilities = capabilities}
end

local function setup_servers()
  for _, server in pairs(default_servers) do
    lspconfig[server].setup(make_config())
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

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
-- vim.api.nvim_create_autocmd(
--   "BufWritePre",
--   {
--     buffer = 0,
--     callback = function()
--       vim.lsp.buf.format()
--     end
--   }
-- )

local signs = {Error = " ", Warning = " ", Hint = " ", Information = " "}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
