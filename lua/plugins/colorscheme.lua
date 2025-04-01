return {
  "Mofiqul/dracula.nvim",

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- plugins = {
      --   Dap = true,
      -- },
      on_highlights = function(hl, c)
        hl.BufferCurrent = { bg = c.fg_gutter, fg = c.fg }

        hl.D255Nbsp = { bg = c.bg_highlight, fg = c.fg }

        -- hl.Dap
        hl.DapBreakpoint = { fg = c.red }
        hl.DapBreakpointCondition = { fg = c.yellow }
        hl.DapBreakPointRejected = { fg = c.orange }
        hl.DapLogPoint = { fg = c.cyan }
        hl.DapStopped = { fg = c.baby_pink }

        -- hl.DapUI
        hl.DapUIScope = { fg = c.cyan }
        hl.DapUIType = { fg = c.dark_purple }
        hl.DapUIValue = { fg = c.cyan }
        hl.DapUIVariable = { fg = c.white }
        hl.DapUIModifiedValue = { fg = c.orange }
        hl.DapUIDecoration = { fg = c.cyan }
        hl.DapUIThread = { fg = c.green }
        hl.DapUIStoppedThread = { fg = c.cyan }
        hl.DapUISource = { fg = c.lavender }
        hl.DapUILineNumber = { fg = c.cyan }
        hl.DapUIFloatBorder = { fg = c.cyan }

        hl.DapUIWatchesEmpty = { fg = c.baby_pink }
        hl.DapUIWatchesValue = { fg = c.green }
        hl.DapUIWatchesError = { fg = c.baby_pink }

        hl.DapUIBreakpointsPath = { fg = c.cyan }
        hl.DapUIBreakpointsInfo = { fg = c.green }
        hl.DapUIBreakPointsCurrentLine = { fg = c.green, bold = true }
        hl.DapUIBreakpointsDisabledLine = { fg = c.grey_fg2 }

        hl.DapUIStepOver = { fg = c.blue }
        hl.DapUIStepOverNC = { fg = c.blue }
        hl.DapUIStepInto = { fg = c.blue }
        hl.DapUIStepIntoNC = { fg = c.blue }
        hl.DapUIStepBack = { fg = c.blue }
        hl.DapUIStepBackNC = { fg = c.blue }
        hl.DapUIStepOut = { fg = c.blue }
        hl.DapUIStepOutNC = { fg = c.blue }
        hl.DapUIStop = { fg = c.red }
        hl.DapUIStopNC = { fg = c.red }
        hl.DapUIPlayPause = { fg = c.green }
        hl.DapUIPlayPauseNC = { fg = c.green }
        hl.DapUIRestart = { fg = c.green }
        hl.DapUIRestartNC = { fg = c.green }
        hl.DapUIUnavailable = { fg = c.grey_fg }
        hl.DapUIUnavailableNC = { fg = c.grey_fg }
      end,
    },
  },
}
