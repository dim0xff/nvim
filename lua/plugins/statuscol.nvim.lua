return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    local b = require 'statuscol.builtin'
    require("statuscol").setup({
      relculright = true,

      clickhandlers = {   -- builtin click handlers
        Lnum                   = builtin.lnum_click,
        FoldClose              = builtin.foldclose_click,
        FoldOpen               = builtin.foldopen_click,
        FoldOther              = builtin.foldother_click,
        DapBreakpointRejected  = builtin.toggle_breakpoint,
        DapBreakpoint          = builtin.toggle_breakpoint,
        DapBreakpointCondition = builtin.toggle_breakpoint,
        ["diagnostic/signs"]   = builtin.diagnostic_click,
        gitsigns               = builtin.gitsigns_click,
        gitsigns_signs_        = builtin.gitsigns_click,
      },

      segments = {
        {
          text = { b.foldfunc, " " },
          click = 'v:lua.ScFa'
        },
        {
          sign = {
            name = { '.*' },
            maxwidth = 1,
            auto = true
          },
          click = 'v:lua.ScSa'
        },
        {
          sign = {
            namespace = { 'diagnostic' },
            maxwidth = 1,
            auto = true
          },
          click = 'v:lua.ScSa'
        },
        {
          sign = {
            namespace = { 'gitsigns' },
            maxwidth = 1,
            auto = true
          },
          click = 'v:lua.ScSa'
        },
        {
          sign = {
            name = { 'Dap' },
            maxwidth = 1,
            auto = true
          },
          click = 'v:lua.ScSa'
        },
        {
          text = { b.lnumfunc, ' ' },
          click = 'v:lua.ScLa'
        }

      },
    })
  end,
}

