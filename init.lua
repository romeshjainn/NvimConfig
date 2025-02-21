-- Lazy.nvim (Plugin Manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- 📂 File Tree (Sidebar)
  { "nvim-tree/nvim-tree.lua", config = function() require("nvim-tree").setup() end },

  -- 📌 Status Line (Bottom Bar)
  { "nvim-lualine/lualine.nvim", config = function() require("lualine").setup() end },

  -- 🔍 Fuzzy Finder (Telescope)
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- 🎨 Syntax Highlighting & Treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "javascript", "typescript", "tsx", "html", "css" },
        highlight = { enable = true },
      })
    end
  },

  -- 📝 Better Code Commenting
  { "numToStr/Comment.nvim", config = function() require("Comment").setup() end },

  -- 🔥 Git Integration
  { "tpope/vim-fugitive" },

  -- ⚡ Auto-close brackets & quotes
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end },

  -- 🗂️ Bufferline (Better Tab Navigation)
  { "akinsho/bufferline.nvim", config = function() require("bufferline").setup() end },

  -- 🚀 Startup Screen
  { "goolord/alpha-nvim", config = function() require("alpha").setup(require("alpha.themes.startify").config) end },

  -- 🎨 Prettier (Formatter)
  { "MunifTanjim/prettier.nvim" },

  -- ⚙️ LSP & Autocomplete
  { "neovim/nvim-lspconfig", config = function()
      require("lspconfig").ts_ls.setup({}) -- Updated from tsserver to ts_ls
      require("lspconfig").eslint.setup({})
    end
  },
  { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        })
      })
    end
  }
})

-- 📌 Basic Settings
vim.opt.number = true                  -- Show line numbers
vim.opt.relativenumber = true           -- Relative line numbers
vim.opt.termguicolors = true            -- Enable 24-bit colors
vim.opt.clipboard = "unnamedplus"       -- Use system clipboard
vim.opt.cursorline = true               -- Highlight the current line
vim.opt.expandtab = true                -- Convert tabs to spaces
vim.opt.shiftwidth = 2                   -- Indentation size
vim.opt.tabstop = 2                      -- Tab size
vim.opt.smartindent = true               -- Smart indentation
vim.opt.wrap = false                     -- Disable word wrap

-- 🏎️ Faster Key Mappings
vim.g.mapleader = "\\"  -- Set leader key to backslash (\)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- Open File Tree with \
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>") -- Find files with \
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>") -- Live grep search with \

-- 🔄 Auto-start terminal in Insert mode
vim.cmd("autocmd TermOpen * startinsert")

-- 🖥 Set Git Bash as Default Terminal
-- vim.o.shell = '"C:/Program Files/Git/bin/bash.exe"'
-- vim.o.shellcmdflag = "-c"
vim.o.shell = "cmd.exe"
vim.o.shellcmdflag = "/c"

