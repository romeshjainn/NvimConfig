return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of LSP servers for Mason to install
      ensure_installed = {
        "tsserver",  -- TypeScript & JavaScript LSP
        "html",      -- HTML LSP
        "cssls",     -- CSS LSP
        "tailwindcss", -- TailwindCSS LSP
        "svelte",    -- Svelte LSP
        "lua_ls",    -- Lua LSP
        "graphql",   -- GraphQL LSP
        "emmet_ls",  -- Emmet LSP
        "prismals",  -- Prisma LSP
        "pyright",   -- Python LSP
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- Prettier formatter
        "stylua",   -- Lua formatter
        "isort",    -- Python formatter
        "black",    -- Python formatter
        "pylint",   -- Python linter
        "eslint_d", -- ESLint daemon
      },
    })
  end,
}
