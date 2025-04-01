return {
  'vidocqh/auto-indent.nvim',
  opts = {},
  init = function()
    require("auto-indent").setup({
      lightmode = true,
      indentexpr = nil,
      --ignore_filetype = { 'yaml' },
    })
  end,
}
