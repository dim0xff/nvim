return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  init = function()
    require("trouble").setup({
      modes = {
        todo_preview = {
          mode = "todo",
          filter = {
            any = {
              function(item)
                return (
                  item.filename:find((vim.loop or vim.uv).cwd(), 1, true) == 1
                  and item.filename:find((vim.loop or vim.uv).cwd() .. "/vendor", 1, true) == nil
                )
              end,
            },
          },
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.45,
          },
        },
        diagnostics_preview = {
          mode = "diagnostics",
          filter = {
            any = {
              function(item)
                return (
                  item.filename:find((vim.loop or vim.uv).cwd(), 1, true) == 1
                  and item.filename:find((vim.loop or vim.uv).cwd() .. "/vendor", 1, true) == nil
                )
              end,
            },
          },
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.45,
          },
        },
      },
    })
  end,
}
