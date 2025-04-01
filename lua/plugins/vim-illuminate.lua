return {
  'rrethy/vim-illuminate',
  init = function()
    require("illuminate").configure({
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    })

    -- change the highlight style
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { reverse = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { reverse = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { reverse = true })

    --- auto update the highlight style on colorscheme change
    vim.api.nvim_create_autocmd({ "ColorScheme" }, {
      pattern = { "*" },
      callback = function(ev)
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { reverse = true })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { reverse = true })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { reverse = true })
      end
    })

    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("]]", "next")
    map("[[", "prev")

    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map("]]", "next", buffer)
        map("[[", "prev", buffer)
      end,
    })
  end,
  keys = {
    { "]]", desc = "Next Reference" },
    { "[[", desc = "Prev Reference" },
  },
}

