return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          -- preview_cutoff = 120,
        },
        file_ignore_patterns = { "node_modules" },
        path_display = { "truncate" },
        winblend = 0,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      },

      -- extensions_list = { "themes", "terms", "ui-select" },

      extensions = {
        ["themes"] = {},
        ["terms"] = {},
        ["ui-select"] = {},
      },
    }
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    init = function()
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end
  },
}
