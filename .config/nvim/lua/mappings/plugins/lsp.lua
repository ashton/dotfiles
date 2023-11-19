local function symbols_filter_input(scope)
  local Input = require("nui.input")
  local popup_options = {
    position = "50%",
    size = 20,
    border = {
      style = "rounded",
      text = {
        top = "[Type a filter]",
        top_align = "left",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal",
    },
  }

  local input = Input(popup_options, {
    on_submit = function(filters)
      local telescope = require("telescope.builtin")
      local opts = {}
      local keys = filters:gmatch("(%a+)=")

      for key in keys do
        opts[key] = {}
        local values = filters:gsub(key .. "=", "")
        for value in values:gmatch("(%a+),?") do
          table.insert(opts[key], value)
        end
      end

      if scope == "document" then
        telescope.lsp_document_symbols(opts)
      elseif scope == "workspace" then
        telescope.lsp_workspace_symbols(opts)
      end
    end,
  })

  input:mount()
end

local function symbols_custom_search_menu()
  local Menu = require("nui.menu")
  local menu = Menu({
    position = "50%",
    sizi = {
      width = 25,
      height = 5,
    },
    border = {
      style = "single",
      text = {
        top = "[Choose-an-Element]",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
  }, {
    lines = {
      Menu.item("Document Symbols", { id = 1 }),
      Menu.item("Workspace Symbols", { id = 2 }),
    },
    max_width = 20,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_submit = function(item)
      local scope = (item.id == 1 and "document" or "workspace")
      symbols_filter_input(scope)
    end
  })

  menu:mount()
end

local leader_mappings = {
  c = {
    name = "+code",
    a = {
      function()
        vim.lsp.buf.code_action()
      end,
      "code action"
    },
    d = {
      function()
        require "trouble".open("lsp_definitions")
      end,
      "go to definition"
    },
    D = {
      function()
        require "trouble".open("lsp_references")
      end,
      "find references"
    },
    f = {
      function()
        vim.lsp.buf.format()
      end,
      "format buffer"
    },
    k = {
      function()
        vim.lsp.buf.hover()
      end,
      "documentation"
    },
    h = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "signagure help"
    },
    r = {
      function()
        vim.lsp.buf.rename()
      end,
      "rename symbol"
    },
    s = {
      name = "+symbols",
      b = { "<Cmd>Telescope lsp_document_symbols<CR>", "all buffer symbols" },
      c = { function() symbols_custom_search_menu() end, "custom search" },
      w = { "<Cmd>Telescope lsp_workspace_symbols<CR>", "all workspace symbols" },
    },
    x = {
      b = { "<Cmd>TroubleToggle document_diagnostics<CR>", "buffer diagnostics" },
      f = { "<Cmd>TroubleToggle quickfix<CR>", "quickfix list" },
      l = { function() vim.diagnostic.open_float(0, { scope = 'line' }) end, "line diagnostics" },
      p = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", "project diagnostics" },
    }
  }
}

local goto_mappings = {
  name = "+goto",
  d = {
    function()
      vim.lsp.buf.definition()
    end,
    "go to definition"
  },
  D = {
    function()
      vim.lsp.buf.references()
    end,
    "find references"
  }
}

local next_mappings = {
  name = "+next",
  e = {
    function()
      vim.diagnostic.goto_next()
    end,
    "next diagnostic"
  }
}

local prev_mappings = {
  name = "+previous",
  e = {
    function()
      vim.diagnostic.goto_prev()
    end,
    "previous diagnostic"
  }
}

vim.keymap.set("v", "<leader>ca", "<cmd><C-U>lua vim.lsp.buf.code_action()<CR>", { desc = "code action for range" })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "show documentation" })

return {
  ["<leader>"] = leader_mappings,
  ["["] = prev_mappings,
  ["]"] = next_mappings,
  g = goto_mappings
}
