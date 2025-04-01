-- dont list quickfix buffers
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "perl",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 4
    vim.expandtab = true
  end
})

-- user event that loads after UIEnter + only if file buf is there
vim.api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_buf_get_option(args.buf, "buftype")

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name "NvFilePost"

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})

        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end)
    end
  end,
})

vim.api.nvim_create_augroup("MyAutoCmds", { clear = true })

-- save session
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = "MyAutoCmds",
  callback = function()
    require('resession').save(vim.fn.getcwd())
  end
})

vim.api.nvim_create_autocmd('StdinReadPre', {
  group = "MyAutoCmds",
  callback = function()
    -- Store this for later
    vim.g.using_stdin = true
  end,
})


vim.api.nvim_create_autocmd("VimEnter", {
  group = "MyAutoCmds",
  callback = function()
    -- Only load the session if nvim was started with no args and without reading from stdin
    if vim.fn.argc(-1) == 0 and not vim.g.using_stdin then
      -- Save these to a different directory, so our manual sessions don't get polluted
      require('resession').load(vim.fn.getcwd(), { silence_errors = true })
      require('nvim-tree.api').tree.toggle(false, true)
    end
  end,
  nested = true,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    require('resession').save(vim.fn.getcwd(), { notify = false })
  end,
})
