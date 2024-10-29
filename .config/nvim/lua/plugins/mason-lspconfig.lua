local function config(lsp_zero)
  require("mason-lspconfig").setup({
    ensure_installed = {
      "bashls",
      "html",
      "jsonls",
      "elmls",
      "rescriptls",
      "lua_ls",
      "tsserver",
      --  "hls",
      "rust_analyzer",
      "svelte",
      "elixirls",
      -- "nextls",
      "yamlls",
    },

    handlers = {
      function(server_name)
        require 'lspconfig'[server_name].setup({})
      end,

      elixirls = function()
        require 'lspconfig'.elixirls.setup({
          settings = {
            dialyzerEnabled = true,
            fetchDeps = true,
            enableTestLenses = true,
            suggestSpecs = true,
          }
        })
      end,

      rescriptls = function()
        require 'lspconfig'.rescriptls.setup({
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
        })
      end,

      gleam = function()
        require 'lspconfig'.gleam.setup {}
      end
    }
  })

  require 'lspconfig'.ocamllsp.setup {}
end

return { config = config }
