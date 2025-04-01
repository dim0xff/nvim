local M = {}
local map = vim.keymap.set

M.on_attach123 = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
  -- map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")
  vim.keymap.set("n", "<leader>ra", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
  end, { expr = true, desc = "LSP renamer" })

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
  map("n", "gr", vim.lsp.buf.references, opts "Show references")
end

M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.lua_ls = function()
  local lspconfig = require("lspconfig")

  lspconfig.lua_ls.setup {
    capabilities = M.capabilities,
    on_init = M.on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }
end

M.ts_ls = function()
  local lspconfig = require("lspconfig")

  lspconfig.ts_ls.setup {
    settings = {
      documentFormatting = true
    },
  }
end

M.perlnavigator = function()
  local lspconfig = require("lspconfig")

  lspconfig.perlnavigator.setup {
    perlPath = '/home/d255/perl5/perlbrew/perls/perl-5.34.1/bin/perl',
    on_attach = function(client, bufnr)
      vim.g.inlay_hints_visible = true
      vim.lsp.inlay_hint.enable() -- bufnr, true)
    end,
  }
end

M.gopls = function()
  local lspconfig = require("lspconfig")
  local util = require("lspconfig/util")
  --local navic = require("nvim-navic")

  lspconfig.gopls.setup {
    on_attach = function(client, bufnr)
      vim.g.inlay_hints_visible = true
      vim.lsp.inlay_hint.enable() -- bufnr, true)

      -- if client.server_capabilities.documentSymbolProvider then
      --     navic.attach(client, bufnr)
      -- end
    end,
    capabilities = M.capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        usePlaceholders = true,
        staticcheck = true,
        semanticTokens = true,
        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        codelenses = {
          gc_details = true,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        hints = {
          assignVariableTypes = false,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        analyses = {
          unusedparams = true,
          unusedwrite = true,
          shadow = true,
          fieldalignment = false,
          fillreturns = true,
          useany = true,
        },
      },
    },
  }
end

M.golangci_lint_ls = function()
  local lspconfig = require("lspconfig")

  lspconfig.golangci_lint_ls.setup {
    filetypes = { 'go', 'gomod' },
    --  cmd = {'golangci-lint-langserver'},
    --  init_options = {
    --     command = { "golangci-lint", "run", "--enable-all", "--disable", "godot", "--out-format", "json", "--issues-exit-code=1" },
    --  },
  }
end

return {
  "neovim/nvim-lspconfig",
  event = "User FilePost",
  opts = {
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  },
  config = function()
    M.lua_ls()
    M.ts_ls()
    M.perlnavigator()
    M.gopls()
    M.golangci_lint_ls()
  end,
}
