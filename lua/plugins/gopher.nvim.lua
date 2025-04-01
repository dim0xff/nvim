return {
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    dependencies = { -- dependencies
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd("silent! GoInstallDeps")
    end,
  },

  {
    "triarius/json2struct.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    init = function()
      require("json2struct").setup()
    end,
  },
}
