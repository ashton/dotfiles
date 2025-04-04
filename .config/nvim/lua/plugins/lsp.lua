local format_au_group = vim.api.nvim_create_augroup("LspFormat", { clear = true })

local function get_extra_config(language_server)
  local config_table = {
    elixirls = {
      settings = {
        dialyzerEnabled = true,
        fetchDeps = true,
        enableTestLenses = true,
        suggestSpecs = true,
      }
    },
    rescriptls = {
      init_options = {
        extensionConfiguration = {
          askToStartBuild = true,
          allowBuiltInFormatter = true,
          signatureHelp = {
            enabled = true
          }
        }
      },
      settings = {
        codeLens = true,
        autoRunCodeAnalysis = true,
      }
    },
    ocamllsp = {},
    gleam = {}
  }

  return config_table[language_server] or {}
end

local function on_attach_chain(client, bufnr)
  -- autocmd to format buffers with LSP on save
  vim.api.nvim_clear_autocmds({ group = format_au_group, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_au_group,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format()
    end,
  })

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
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspInstall", "LspStart" },
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
          {
            "ray-x/lsp_signature.nvim",
            event = "InsertEnter",
          },
          { "hrsh7th/cmp-nvim-lsp" },
          {
            "antosha417/nvim-lsp-file-operations",
            dependencies = {
              "nvim-lua/plenary.nvim",
              "nvim-neo-tree/neo-tree.nvim",
            },
            config = true
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
      handlers = {
        function(server_name)
          local settings = get_extra_config(server_name)
          local lsp_capabilities = create_capabilities()
          local on_attach = { on_attach = on_attach_chain }

          require 'lspconfig'[server_name].setup(vim.tbl_extend("error",
            settings,
            lsp_capabilities,
            on_attach
          ))
        end,
      }
    }
  },
}
