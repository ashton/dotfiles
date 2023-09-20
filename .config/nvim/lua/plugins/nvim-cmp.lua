local cmp = require "cmp"
local cmp_action = require('lsp-zero').cmp_action()
--local lspkind = require "lspkind"

cmp.setup {
    preselect = "item",
    completion = {
      completeopt = "menu,menuone,noinsert"
    },
    sources = {
      {name = "nvim_lsp", group_index = 1},
      {name = "luasnip", group_index = 1},
      {name = "buffer", group_index = 2},
    },
    mapping = {
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
      ["<Tab>"] = cmp_action.luasnip_supertab(),
      ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
      ["<C-y>"] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ["<C-e>"] = cmp.mapping(
        {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close()
        }
      ),
      ["<CR>"] = cmp.mapping.confirm({select = false}),
    }
  }

  -- Use buffer source for `/`.
cmp.setup.cmdline(
  "/",
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      {name = "buffer"}
    }
  })

-- Use cmdline & path source for ":".
cmp.setup.cmdline(
  ":",
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
      {
        {name = "path"}
      },
      {
        {name = "cmdline"}
      }
    )
  })