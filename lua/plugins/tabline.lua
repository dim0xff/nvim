return {
  {
    "tiagovla/scope.nvim",
    init = function()
      require("scope").setup(
        {
          hooks = {
            pre_tab_leave = function()
              vim.api.nvim_exec_autocmds('User', { pattern = 'ScopeTabLeavePre' })
            end,

            post_tab_enter = function()
              vim.api.nvim_exec_autocmds('User', { pattern = 'ScopeTabEnterPost' })
            end,
          },
        }
      )
    end,
  },

  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = false,
      insert_at_start = true,
      icons = {
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = false, icon = '󰅙 ' },
          [vim.diagnostic.severity.WARN] = { enabled = false, icon = ' ' },
          [vim.diagnostic.severity.INFO] = { enabled = false, icon = '󰋼 ' },
          [vim.diagnostic.severity.HINT] = { enabled = false, icon = '󰌵 ' },
        },
        gitsigns = {
          added = { enabled = false, icon = '+' },
          changed = { enabled = false, icon = '~' },
          deleted = { enabled = false, icon = '-' },
        },

        filetype = { enabled = true },
        separator = { left = '|' },
      },
    },
    -- version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
