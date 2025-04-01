local M = {
  base46 = {
    theme = "tokyonight", -- default theme
    hl_add = {},
    hl_override = {},
    integrations = {
    },
    changed_themes = {},
    transparency = false,
    theme_toggle = { "tokyonight", "tokyonight" },
  },

  ui = {
    cmp = {
      icons_left = false, -- only for non-atom styles!
      style = "default",  -- default/flat_light/flat_dark/atom/atom_colored
      abbr_maxwidth = 60,
      format_colors = {
        tailwind = false, -- will work for css lsp too
        icon = "󱓻",
      },
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    statusline = {
      enabled = false,
      theme = "default", -- default/vscode/vscode_colored/minimal
      -- default/round/block/arrow separators work only for default statusline theme
      -- round and block will work for minimal theme only
      separator_style = "default",
      order = nil,
      modules = nil,
    },

    -- lazyload it when there are 1+ buffers
    tabufline = {
      enabled = false,
      lazyload = true,
      order = { "treeOffset", "buffers", "tabs", "mybtns" },
      modules = {
        mybtns = function()
          local btn = require("nvchad.tabufline.utils").btn
          return btn(" 󰅖 ", "CloseAllBufsBtn", "CloseAllBufs")
        end,
      },
      bufwidth = 21,
    },
  },

  term = {
    base46_colors = true,
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "grid",                                                     -- simple/grid
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
  },

  mason = { pkgs = {}, skip = {} },

  colorify = {
    enabled = false,
  },
}

return M
