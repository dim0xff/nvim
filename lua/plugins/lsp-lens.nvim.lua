return {
  'VidocqH/lsp-lens.nvim',
  init = function()
    local SymbolKind = vim.lsp.protocol.SymbolKind

    require 'lsp-lens'.setup({
      enable = true,
      include_declaration = false, -- Reference include declaration
      sections = {                 -- Enable / Disable specific request, formatter example looks 'Format Requests'
        definition = false,
        references = function(count)
          return "refs:" .. count
        end,
        implements = function(count)
          return "impl:" .. count
        end,
        git_authors = function(count)
          return "git:" .. count
        end,
      },
      separator = " ",
      ignore_filetype = {
        "prisma",
      },
      -- Target Symbol Kinds to show lens information
      target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
      -- Symbol Kinds that may have target symbol kinds as children
      wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct, SymbolKind.Interface },
    })
  end,
}

