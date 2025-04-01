return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        'branch',
        'diff',
        'diagnostics',
      },
      lualine_c = { 'filename' },
      lualine_x = {
        'encoding',
        'fileformat',
        'filetype',
        function()
          local enc = vim.opt.fileencoding:get()
          if not enc or enc == "" then
            return ""
          end
          local name = vim.fn.getcwd()
          name = "󰉖 " .. (name:match "([^/\\]+)[/\\]*$" or name)
          return (vim.o.columns > 85 and name) or ""
        end
      },
      lualine_y = {
        function()
          return "%b 0x%B"
        end,
      },
      lualine_z = {
        'progress',
        function()
          return "%v ☰%l/%L"
        end
      }
    },
  },
  init = function()
    require('lualine').setup({})
  end
}
