return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  init = function()
    require 'neo-tree'.setup {
      sources = { "document_symbols" },
      default_source = "document_symbols",
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },

      document_symbols = {
        follow_cursor = true,
        kinds = {
          Unknown = { icon = "?", hl = "" },
          Root = { icon = "", hl = "NeoTreeRootName" },
          File = { icon = "󰈙", hl = "Tag" },
          Module = { icon = "", hl = "Exception" },
          Namespace = { icon = "󰌗", hl = "Include" },
          Package = { icon = "", hl = "Label" },
          Class = { icon = "󰌗", hl = "Include" },
          Method = { icon = "󰆧", hl = "Function" },
          Property = { icon = "", hl = "@property" },
          Field = { icon = "", hl = "@field" },
          Constructor = { icon = "", hl = "@constructor" },
          Enum = { icon = "󰒻", hl = "@number" },
          Interface = { icon = "󰕘", hl = "Type" },
          Function = { icon = "󰊕", hl = "Function" },
          Variable = { icon = "󰆧", hl = "@variable" },
          Constant = { icon = "󰏿", hl = "Constant" },
          String = { icon = "󰀬", hl = "String" },
          Number = { icon = "󰎠", hl = "Number" },
          Boolean = { icon = "◩", hl = "Boolean" },
          Array = { icon = "󰅪", hl = "Type" },
          Object = { icon = "󰅩", hl = "Type" },
          Key = { icon = "󰌋", hl = "" },
          Null = { icon = "󰟢", hl = "Constant" },
          EnumMember = { icon = "", hl = "Number" },
          Struct = { icon = "󰌗", hl = "Type" },
          Event = { icon = "", hl = "Constant" },
          Operator = { icon = "󰆕", hl = "Operator" },
          TypeParameter = { icon = "󰊄", hl = "Type" },
          Macro = { icon = '󰉨', hl = 'Macro' },
        }

      },
      -- window = {
      --   mappings = {
      --     ["<space>"] = "none",
      --   },
      -- },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    }
  end,
}
