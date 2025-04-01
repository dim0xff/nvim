local map = vim.keymap.set

-- LSP
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map({ "n", "i" }, "<A-q>", vim.lsp.buf.hover, { desc = "LSP hover" })

map("n", "gr", "<cmd> Telescope lsp_references<CR>", { desc = "LSP references" })
map("n", "gd", "<cmd> Telescope lsp_definitions<CR>", { desc = "LSP definition" })
map("n", "gi", "<cmd> Telescope lsp_implementations<CR>", { desc = "LSP references" })

map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Show signature help" })

map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })


map("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

map("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Go to type definition" })


map("n", "<leader>ra", require "nvchad.lsp.renamer", { desc = "LSP renamer" })

-- map("n", "<leader>ra", function()
--   return ":IncRename " .. vim.fn.expand("<cword>")
-- end, { expr = true, desc = "LSP renamer" })

map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })


-- general
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "new buffer" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<F2>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<F10><F10>", "<C-C>:qall<CR>", { desc = "quit" })

map({ "n", "i" }, "<S-Del>", "<cmd>:delete<CR>", { desc = "delete current line" })

map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

map("n", "<leader>fm", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "general format file" })

map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "diagnostic loclist" })
map("n", "<leader>lf", function() vim.diagnostic.open_float { border = "rounded" } end, { desc = "floating diagnostic" })

map("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "restart LSP" })

map("n", "<leader>ww", "<cmd>set wrap!<CR>", { desc = "toggle line wrap" })

-- move
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-Up>", "<C-y><Up>", { desc = "slide up" })
map("i", "<C-Up>", "<Esc>l<C-y><Up>", { desc = "slide up" })
map("n", "<C-Down>", "<C-e><Down>", { desc = "slide down" })
map("i", "<C-Down>", "<Esc>l<C-e><Down>", { desc = "slide down" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<C-P>", "<C-I>", { desc = "jump forward" })

map("n", "[d", function() vim.diagnostic.jump { count = -1, float = true } end, { desc = "prev diagnostic" })
map("n", "]d", function() vim.diagnostic.jump { count = 1, float = true } end, { desc = "next diagnostic" })

-- resize win
map("n", "<A-Up>", "<cmd>:resize +2<CR>", { desc = "resize height +2" })
map("n", "<A-Down>", "<cmd>:resize -2<CR>", { desc = "resize height -2" })
map("n", "<A-Left>", "<cmd>:vertical resize -2<CR>", { desc = "resize width -2" })
map("n", "<A-Right>", "<cmd>:vertical resize +2<CR>", { desc = "resize width +2" })


map({ "n", "i" }, "<F3>", "<cmd>Neotree document_symbols<CR>", { desc = "show document symbols" })
map({ "n", "i" }, "<F3><F3>", "<cmd>Neotree close<CR>", { desc = "hide document symbols" })

-- comment
map("n", "<C-_>", function()
    require("Comment.api").toggle.linewise.current()
    vim.cmd('execute "norm j"')
  end,
  { desc = "toggle comment", remap = true }
)

map("i", "<C-_>", function()
    require("Comment.api").toggle.linewise.current()
    -- vim.cmd('execute "norm j"')
  end,
  { desc = "toggle comment", remap = true }
)

map("v", "<C-_>", "gc",
  { desc = "toggle comment", remap = true }
)


-- telescope find
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" })

map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })

map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })

-- telescope git
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })

-- term
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

map("n", "<leader>th", "<cmd>Telescope colorscheme<CR>", { desc = "telescope colorschemes" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- nvimtree
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
map("n", "<F4>", function()
  local view = require("nvim-tree.view")
  if view.is_visible() then
    if view.get_winnr(nil) == vim.api.nvim_get_current_win() then
      vim.cmd('NvimTreeToggle')
    else
      vim.cmd('NvimTreeFocus')
    end
  else
    vim.cmd('NvimTreeToggle')
  end

  vim.cmd('colorscheme tokyonight')
  vim.cmd('colorscheme tokyonight')
end, { desc = "Focus/toggle nvimtree" })


-- gitsigns
map("n", "]h",
  function()
    if vim.wo.diff then
      return "]h"
    end
    vim.schedule(function()
      require("gitsigns").next_hunk()
    end)
    return "<Ignore>"
  end,
  { desc = "git next hunk", expr = true }
)

map("n", "[h",
  function()
    if vim.wo.diff then
      return "[h"
    end
    vim.schedule(function()
      require("gitsigns").prev_hunk()
    end)
    return "<Ignore>"
  end,
  { desc = "git prev hunk", expr = true }
)

map("n", "<leader>hs",
  function()
    require("gitsigns").stage_hunk()
  end,
  { desc = "git stage hunk" }
)

map("n", "<leader>hus",
  function()
    require("gitsigns").undo_stage_hunk()
  end,
  { desc = "git undo stage hunk" }
)

map("n", "<leader>hr",
  function()
    require("gitsigns").reset_hunk()
  end,
  { desc = "git reset hunk" }
)

map("n", "<leader>hp",
  function()
    require("gitsigns").preview_hunk()
  end,
  { desc = "git preview hunk" }
)

map("n", "<leader>",
  function()
  end,
  { desc = "git " }
)

map("n", "<leader>gb",
  function()
    require("gitsigns").blame_line()
  end,
  { desc = "git blabe line" }
)

map("n", "<leader>gtd",
  function()
    require("gitsigns").toggle_deleted()
  end,
  { desc = "git toggle deleted" }
)

map("v", "<leader>hs",
  function()
    require('gitsigns').stage_hunk({ vim.fn.line '.', vim.fn.line 'v' })
  end,
  { desc = "git stage hunk" }
)

map("v", "<leader>hus",
  function()
    require('gitsigns').undo_stage_hunk({ vim.fn.line '.', vim.fn.line 'v' })
  end,
  { desc = "git undo stage hunk" }
)

map("v", "<leader>hr",
  function()
    require('gitsigns').reset_hunk({ vim.fn.line '.', vim.fn.line 'v' })
  end,
  { desc = "git reset hunk" }
)


-- trouble
map("n", "<leader>XX",
  "<cmd>Trouble diagnostics_preview toggle focus=true<cr>",
  { desc = "trouble diagnostics" }
)

map("n", "<leader>xx",
  "<cmd>Trouble diagnostics_preview toggle focus=true filter.buf=0<cr>",
  { desc = "trouble buffer diagnostics" }
)

map("n", "<leader>TT",
  "<cmd>Trouble todo_preview toggle focus=true<cr>",
  { desc = "TODOs" }
)

map("n", "<leader>tt",
  "<cmd>Trouble todo_preview toggle focus=true filter.buf=0<cr>",
  { desc = "buffer TODOs" }
)


-- barbar
map("n", "<Tab>", "<cmd>BufferNext<cr>", { desc = "next buffer" })
map("n", "<S-Tab>", "<cmd>BufferPrevious<cr>", { desc = "prev buffer" })
map("n", "<leader>x", "<cmd>BufferClose<cr>", { desc = "close buffer" })
map("n", "<leader>X", "<cmd>BufferRestore<cr>", { desc = "restore buffer" })
