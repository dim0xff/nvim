return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "luukvbaal/statuscol.nvim",
  },
  event = "BufReadPost",
  opts = {
    provider_selector = function()
      return {
        "treesitter",
        "indent",
      }
    end,
  },

  init = function()
    vim.keymap.set("n", "zR", function()
      require("ufo").openAllFolds()
    end)
    vim.keymap.set("n", "zM", function()
      require("ufo").closeAllFolds()
    end)
  end,
}
