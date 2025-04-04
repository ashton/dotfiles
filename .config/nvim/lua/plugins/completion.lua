local function enter_action(fallback)
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  if cmp.visible() then
    if luasnip.expandable() then
      luasnip.expand()
    else
      cmp.confirm({ select = true })
    end
  else
    fallback()
  end
end

local function tab_action(fallback)
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.locally_jumpable(1) then
    luasnip.jump(1)
  else
    fallback()
  end
end

local function shift_tab_action(fallback)
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.locally_jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "saadparwaiz1/cmp_luasnip" },
      { "onsails/lspkind.nvim" }
    },
    opts = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        preselect = cmp.PreselectMode.Item,
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "luasnip" },
          { name = "cmdline" },
          { name = "path" },
          { name = "buffer" }
        }),
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping(enter_action),
          ["<Tab>"] = cmp.mapping(tab_action, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(shift_tab_action, { "i", "s" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-y>"] = cmp.config.disable,
        }),
        formatting = {
          format = lspkind.cmp_format({
            preset = "codicons",
            mode = 'symbol_text', -- show only symbol annotations
            menu = ({
              buffer = "󱞁",
              nvim_lsp = "󰒓",
              luasnip = "󰫙",
              path = ""
            }),
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          })
        }
      }
    end,

    config = function(_, opts)
      local cmp = require("cmp")
      cmp.setup(opts)

      cmp.setup.cmdline('/', { sources = cmp.config.sources({ { name = "buffer" } }) })
      cmp.setup.cmdline(':', { sources = cmp.config.sources({ { name = "cmdline" } }) })
    end
  }
}
