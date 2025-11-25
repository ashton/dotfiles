local function on_attach_chain(client, bufnr)
  -- autocmd to format buffers with LSP on save
  --
  require("lsp_signature").on_attach({
    floating_window = false,
    hint_enable = false
  }, bufnr)

  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

local function create_capabilities()
  local config = { capabilities = vim.lsp.protocol.make_client_capabilities() }

  local completion_capabilities = require("cmp_nvim_lsp").default_capabilities()
  local file_operation_capabilities = require("lsp-file-operations").default_capabilities()

  config.capabilities = vim.tbl_deep_extend('force',
    config.capabilities,
    completion_capabilities,
    file_operation_capabilities
  )

  return config
end


return {
  { "williamboman/mason.nvim", lazy = true, config = true },
  {
    "j-hui/fidget.nvim",
    version = false,
    event = "LspAttach",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
          { "hrsh7th/cmp-nvim-lsp" },
          {
            "antosha417/nvim-lsp-file-operations",
            dependencies = {
              "nvim-lua/plenary.nvim",
              "nvim-neo-tree/neo-tree.nvim",
            },
            config = function()
              vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('custom.lsp', {}),
                callback = function(args)
                  local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

                  -- Auto format buffer
                  if not client:supports_method('textDocument/willSaveWaitUntil') and client:supports_method('textDocument/formatting') then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                      group = vim.api.nvim_create_augroup('custom.lsp', { clear = false }),
                      buffer = args.buf,
                      callback = function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                      end,
                    })
                  end
                end
              })

              vim.lsp.config('*', {
                capabilities = create_capabilities(),
                on_attach = on_attach_chain
              })

              vim.lsp.enable('gleam')
              vim.lsp.enable('ocamllsp')
            end
          },
          {
            "SmiteshP/nvim-navic",
            config = true
          }
        },
      },
    },
    opts = {
      ensure_installed = {
        "bashls",
        "html",
        "jsonls",
        "elmls",
        "rescriptls",
        "lua_ls",
        "ts_ls",
        --  "hls",
        "rust_analyzer",
        "svelte",
        "elixirls",
        -- "nextls",
        "yamlls",
      },
      automatic_enable = true
    },
  },
}
