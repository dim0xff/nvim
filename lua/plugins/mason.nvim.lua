return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  -- MasonInstall dlv gofumpt goimports goimports-reviser golangci-lint golangci-lint-langserver gopls lua-language-server revive
  opts = {
    PATH = "skip",

    ui = {
      icons = {
        package_pending = "⦾ ",
        package_installed = "⦿ ",
        package_uninstalled = "◯ ",
      },

      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
        cancel_installation = "<C-c>",
      },
    },

    max_concurrent_installers = 10,
  },
}
