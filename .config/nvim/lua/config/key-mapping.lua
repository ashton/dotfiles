return function()
  vim.keymap.set("n", "s", "<nop>")
  vim.keymap.set("n", "<C-I>", "<Tab>", { noremap = true })
  return {
    { "<bs><bs>", desc = "Clear search highlights" },
    { "<tab>", "%", desc = "go to matching part", mode = { "n" } },

    { "<leader>b", group = "buffer", icon = "󰪷" },
    { "<leader>bn", "<CMD>bn<CR>", desc = "Go to next buffer" },
    { "<leader>bp", "<CMD>bp<CR>", desc = "Go to previous buffer" },
    { "<leader>bl", "<CMD>b#<CR>", desc = "Go to last buffer" },
    { "<leader>c", group = "code", icon = "" },
    { "<leader>cd", "<CMD>lua vim.lsp.buf.definition()<CR>", icon = "󰞥", desc = "Go to symbol's definition" },
    { "<leader>cD", "<CMD>lua vim.lsp.buf.references()<CR>", icon = "", desc = "Rename item under the cursor" },
    { "<leader>cf", "<CMD>lua vim.lsp.buf.format()<CR>", icon = "󰉶", desc = "format buffer using LSP" },
    { "<leader>cj", icon = "" },
    { "<leader>ck", "<CMD>lua vim.lsp.buf.hover()<CR>", icon = "", desc = "Info for item under the cursor" },
    { "<leader>cs", icon = "󰖶" },
    { "<leader>cr", "<CMD>lua vim.lsp.buf.rename()<CR>", icon = "󰑕", desc = "Rename item under the cursor" },
    { "<leader>ch", "<CMD>lua vim.lsp.buf.signature_help()<CR>", icon = "󰋗", desc = "Shows under the cursor function's signature" },

    { "<leader>d", group = "debug", icon = "" },

    { "<leader>f", group = "file", icon = "󱧶" },

    { "<leader>g", group = "git", icon = "󰊢" },

    { "<leader>p", group = "projects", icon = "" },

    { "<leader>s", group = "search", icon = "󰥨" },

    { "<leader>w", group = "window", proxy = "<C-W>", icon = "" },

    { "<leader>x", group = "diagnostics", icon = "" },

    { "[", group = "previous" },
    { "[e", "<CMD>lua vim.diagnostic.goto_prev()<CR>", icon = "󰮰", desc = "Go to previous diagnostic" },

    { "]", group = "next" },
    { "]e", "<CMD>lua vim.diagnostic.goto_next()<CR>", icon = "󰮲", desc = "Go to next diagnostic" },

    { "g", group = "goto" },
    { "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", icon = "󰞥", desc = "go to symbol definition" },
    { "gr", "<CMD>lua vim.lsp.buf.references()<CR>", icon = { "󰘦" }, desc = "Go to symbol references" },
    { "grr", icon = "" },

    { "X", "<CMD>lua vim.diagnostic.open_float()<CR>", desc = "Open diagnostic in a floating window", icon = { "" } },
    { "<C-SPACE>", "<CMD>lua vim.diagnostic.open_float()<CR>", desc = "Open Diagnostic in a floating window", icon = { "󱂬 " } },
    { "<S-Esc>", "<CMD>NoiceDismiss<CR>", desc = "dismiss noice notifications" },
    { "z", group = "fold", icon = "" },
  }
end
