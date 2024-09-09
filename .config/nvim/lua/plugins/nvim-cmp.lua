local function config()
  local lsp_zero = require "lsp-zero"
  local cmp_action = require "lsp-zero.cmp".action()
  lsp_zero.extend_cmp()

  local cmp = require "cmp"
  local lspkind = require "lspkind"

  require('luasnip.loaders.from_vscode').lazy_load()


  cmp.setup {
    -- makes the first item always be selected
    preselect = "item",
    completion = {
      completeopt = "menu,menuone,noinsert"
    },
    sources = {
      { name = "nvim_lsp", group_index = 1 },
      { name = "luasnip",  group_index = 1 },
      { name = "buffer",   group_index = 2 },
      { name = "path",     group_index = 2 },
    },
    mapping = cmp.mapping.preset.insert({
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["<Tab>"] = cmp_action.luasnip_supertab(),
      ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable,
    }),
    formatting = {
      fields = { 'abbr', 'kind', 'menu' },
      format = lspkind.cmp_format({
        preset = "codicons",
        menu = ({
          buffer = "󱞁",
          nvim_lsp = "󰒓",
          luasnip = "󰫙",
          path = ""
        }),
        mode = 'symbol_text',  -- show only symbol annotations
        maxwidth = 50,         -- prevent the popup from showing more than provided characters
        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
      })
    }
  }

  -- Use buffer source for `/`.
  cmp.setup.cmdline(
    { "/", "?" },
    {
      mapping = cmp.mapping.preset.cmdline({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item()
      }),
      sources = {
        { name = "buffer" }
      }
    })

  -- Use cmdline & path source for ":".
  cmp.setup.cmdline(
    ":",
    {
      preselect = "item",
      mapping = cmp.mapping.preset.cmdline({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item()
      }),
      sources = cmp.config.sources(
        {
          { name = "path" }
        },
        {
          { name = "cmdline" }
        }
      )
    })

  cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
      { name = "dap" }
    }
  })
end

return { config = config }
