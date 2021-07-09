local codeAction = require 'lsputil.codeAction'
local locations = require 'lsputil.locations'
local symbols = require 'lsputil.symbols'

vim.lsp.handlers['textDocument/codeAction'] = codeAction.code_action_handler
vim.lsp.handlers['textDocument/references'] = locations.references_handler
vim.lsp.handlers['textDocument/definition'] = locations.definition_handler
vim.lsp.handlers['textDocument/declaration'] = locations.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = locations.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = locations.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = symbols.document_handler
vim.lsp.handlers['workspace/symbol'] = symbols.workspace_handler
