-- Your Plugins must be added here.
-- =====================
-- (1) Bootstrap lazy.nvim
-- =====================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath, })
end
vim.opt.rtp:prepend(lazypath)

-- =====================
-- Plugins (lazy.nvim)
-- =====================
require("lazy").setup({
spec = {
    -- core
    { "nvim-lua/plenary.nvim",               lazy = true },
    { "nvim-tree/nvim-web-devicons",         lazy = true },

    -- themes (lots of great defaults)
    { "ellisonleao/gruvbox.nvim",            priority = 1000 },
    --{ "projekt0n/github-nvim-theme",         name = "github-theme",                 priority = 999 },
    { "lunarvim/colorschemes" }, -- LunarVim’s default colorscheme collection
    { "folke/tokyonight.nvim" },
    { "catppuccin/nvim",                     name = "catppuccin" },
    { "EdenEast/nightfox.nvim" },
    { "shaunsingh/nord.nvim" },
    { "Mofiqul/vscode.nvim" },
    { "navarasu/onedark.nvim" },
    { "rebelot/kanagawa.nvim" },
    { "chriskempson/vim-tomorrow-theme" },

    -- UI
    { "lewis6991/gitsigns.nvim",             event = { "BufReadPre", "BufNewFile" } },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl",                          event = { "BufReadPost", "BufNewFile" } },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
        config = function()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    --completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            'hrsh7th/cmp-cmdline',
        },
    },

    -- autopairs
    { "windwp/nvim-autopairs",       event = "InsertEnter" },
    {"kylechui/nvim-surround", event = "VeryLazy" , config = true},
    -- Your Plugins here

    -- ==== Formatter (Not Good for Humans)
    --{ "stevearc/conform.nvim",       event = "BufWritePre" },

    -- ===== Statusline
    { "nvim-lualine/lualine.nvim",   dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- ===== Dap + UI
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui",        dependencies = { "mfussenegger/nvim-dap" } },

    {
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- optional: auto-update registry
  event = "VeryLazy",     -- load only when needed for speed
  config = function()
    -- Mason UI setup
    require("mason").setup({
      ui = {
        border = "rounded", -- match Lazy.nvim style
        width = 0.8,
        height = 0.9,
        icons = {
          package_installed   = "󰄳", -- nf-md-check
          package_pending     = "󰌠", -- nf-md-timer_sand
          package_uninstalled = "󰅙", -- nf-md-close_circle
        },
        keymaps = {
          toggle_package_expand   = "<CR>",
          install_package         = "i",
          update_package          = "u",
          check_package_version   = "c",
          update_all_packages     = "U",
          check_outdated_packages = "C",
          uninstall_package       = "x",
          cancel_installation     = "<C-c>",
        },
      },
    })

    -- Optional: match Mason highlight groups with active colorscheme dynamically
    local function set_mason_highlights()
      local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
      local accent = vim.api.nvim_get_hl(0, { name = "String" })
      local title  = vim.api.nvim_get_hl(0, { name = "Title" })
      local fg     = accent.fg or "#89b4fa"
      local bg     = normal.bg or "#1e1e2e"

      vim.api.nvim_set_hl(0, "MasonHeader", { fg = bg, bg = fg, bold = true })
      vim.api.nvim_set_hl(0, "MasonHeaderSecondary", { fg = fg, bg = bg, bold = true })
      vim.api.nvim_set_hl(0, "MasonHighlight", { fg = fg })
      vim.api.nvim_set_hl(0, "MasonHighlightBlock", { fg = bg, bg = fg, bold = true })
      vim.api.nvim_set_hl(0, "MasonHighlightBlockBold", { fg = bg, bg = fg, bold = true })
      vim.api.nvim_set_hl(0, "MasonNormal", { fg = accent.fg or "#cdd6f4", bg = bg })
    end

    -- Run immediately and whenever the theme changes
    set_mason_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", { callback = set_mason_highlights })
  end,
},
    {
    "mason-org/mason.nvim",
    opts = {}
},
    { "nvim-neotest/nvim-nio" },                        -- dependency

    -- ==== Sessions & workspace
    { "rmagatti/auto-session" },
    { "natecraddock/workspaces.nvim" },

    -- ====== Notify
    { "rcarriga/nvim-notify" },

    -- Dashboard (startup screen)
    -- { "nvimdev/dashboard-nvim", event = "VimEnter" },
    -- alpha.nvim (dashboard)
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
        end,
    },
    -- Project.nvim (detect project roots)
    { "ahmedkhalf/project.nvim" },

    -- Trouble.nvim (diagnostics / references UI)
    {
  "folke/trouble.nvim",
  branch = "main",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- Use the defaults for simplicity
    modes = {
      diagnostics = {
        desc = "Diagnostics (all workspace)",
      },
      diagnostics_buffer = {
        desc = "Diagnostics (current buffer)",
      },
      symbols = { desc = "Document Symbols" },
      quickfix = { desc = "QuickFix List" },
      lsp = { desc = "LSP References / Definitions" },
    },
  },
}, 
-- ~/.config/nvim/lua/user/Basics/plugins.lu
    {
      "echasnovski/mini.icons",
      version = false, -- always use latest
      lazy = true,
      config = function()
        require("mini.icons").setup()
      end,
    },

    -- Harpoon (quick file navigation)
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Refactoring
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    },

    -- Todo Comments
    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

    -- Neoscroll (smooth scrolling)
    { "karb94/neoscroll.nvim",    config = true },



    -- =====================
    -- Telescope + Extensions
    -- =====================
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",

            -- 🔹 Performance
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

            -- 🔹 Extra pickers
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-project.nvim",
            "jvgrootveld/telescope-zoxide",
            "debugloop/telescope-undo.nvim",

            -- 🔹 UI
            "nvim-telescope/telescope-ui-select.nvim",
        },
    },




    -- treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- LSP config
    { "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
       local on_attach = function(client, bufnr)
          if client.server_capabilities.documentSymbolProvider then
            require("nvim-navic").attach(client, bufnr)
          end
       end

        
    end
    },

    -- snippets
    { "L3MON4D3/LuaSnip",                lazy = true },
    { "honza/vim-snippets",              lazy = true },

    -- terminal
    { "akinsho/toggleterm.nvim",         version = "*" },

    -- ====================
    --  Add More From here
    -- ====================
    -- Command Cheat Code with Dependency which-key.nvim
    { "mrjones2014/legendary.nvim" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },

    --Better UI
    {
        "folke/snacks.nvim",
        -- version = "v2.22.0",
        version = "*",
        priority = 2000,
        lazy = false,
    },
    ---Dap UI dependencies
    -- in your plugins.lua
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text", -- <--- add this
        },
        config = function()
            require("user.UI.DAP_UI") -- or your dap config
        end,
    },
-- =====================
-- Better UI plugins (organized)
-- =====================
    {
      -- Better vim.ui.select / vim.ui.input
      { "stevearc/dressing.nvim" },

      -- Modern notifications, cmdline, messages
      {
        "folke/noice.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
      },

      -- Auto-resize & manage splits (modern replacement for windows.nvim)
      { "beauwilliams/focus.nvim" },

      -- Fuzzy finder
      { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

      -- File explorer
      {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "nvim-lua/plenary.nvim" },
      },

      -- Quick buffer jump
      { "leath-dub/snipe.nvim" },
    },


-- ##################
-- Inbuilt here
-- ##################

-- #####################################
-- Multicursor Plugin 
-- You can easily move lines up or down 
-- Via c-j c-k in normal mode
-- #####################################   


  {
    "mg979/vim-visual-multi",
    branch = "master"
  },

  {
        "onsails/lspkind-nvim",
        config = function()
            require('lspkind').init()
        end
    },

    {
    "rebelot/heirline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- Put the full Heirline configuration code here
      -- (the one I provided earlier)
    end,
  },
  
    {
    "SmiteshP/nvim-navic",
    lazy = true,
    opts = {
      separator = "  ",
      highlight = true,
      depth_limit = 5,
      icons = {
        File = "󰈙 ",
        Module = " ",
        Namespace = "󰌗 ",
        Package = " ",
        Class = "󰌗 ",
        Method = "󰆧 ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = "󰕘 ",
        Interface = "󰕘 ",
        Function = "󰊕 ",
        Variable = "󰆧 ",
        Constant = "󰏿 ",
        String = "󰀬 ",
        Number = "󰎠 ",
        Boolean = "◩ ",
        Array = "󰅪 ",
        Object = "󰅩 ",
        Key = "󰌋 ",
        Null = "󰟢 ",
        EnumMember = " ",
        Struct = "󰌗 ",
        Event = " ",
        Operator = "󰆕 ",
        TypeParameter = "󰊄 ",
      },
    },
  },

  {
  "MaximilianLloyd/ascii.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = function()
    require("ascii").setup({
      -- optional configs like color, alignment, animation speed
    })
  end
},

    {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets", -- Optional: pre-made snippets
  },
},




-- ==============================================================
-- Configuration for Lazy nvim Keep Plugins below this Comment !
-- ==============================================================



},

    concurrency = 5,        -- ONLY 5 plugins download at once
                          -- Adjust: 3=slow, 5=balanced, 10=fast, 20=very fast
                          -- This is the ONLY setting that limits CPU stress

  git = {
    timeout = 300,        -- Timeout for git operations
    url_format = "https://github.com/%s.git",
  },

  -- ============================
  -- Everything Else Stays Normal
  -- ============================
  install = {
    missing = true,
  },

  checker = {
    enabled = true,       -- Keep auto-check enabled
    notify = true,        -- Keep notifications
    frequency = 3600,     -- Check every hour
  },

  change_detection = {
    enabled = true,
    notify = true,
  },

  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
    },
  },

  defaults = {
    lazy = false,
    version = false,
  },
  -- ===============================
  -- 🎨 Lazy.nvim UI Customization
  -- ===============================
  ui = {
    border = "rounded",             -- "none", "single", "double", "shadow"
    size = { width = 0.88, height = 0.9 },
    wrap = false,
    title = "   Lazy Plugin Manager ",
    backdrop = 70,                  -- 0–100 (transparency)
    icons = {
      cmd        = " ",  -- nf-md-terminal
      config     = " ",  -- nf-fa-gear
      event      = " ",  -- nf-fa-calendar
      ft         = " ",  -- nf-fa-file_text_o
      init       = "⚙️ ",
      import     = " ",  -- nf-oct-package
      keys       = " ",  -- nf-fa-keyboard_o
      lazy       = "󰒲 ",  -- nf-md-sleep
      loaded     = " ",  -- nf-fa-check_circle
      not_loaded = " ",  -- nf-fa-circle_thin
      plugin     = " ",  -- nf-oct-package
      runtime    = " ",  -- nf-dev-vim
      source     = " ",  -- nf-fa-code
      start      = " ",  -- nf-fa-rocket
      task       = " ",  -- nf-fa-tasks
      list       = { "●", "➜", "★", "‒" },
    },
  },
}) ---- Plugins Stop.
-- ===============================
-- 🌈 Make Lazy.nvim adapt to theme
-- ===============================
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or "#1e1e2e"
        local accent = vim.api.nvim_get_hl(0, { name = "String" }).fg or "#89b4fa"
        vim.api.nvim_set_hl(0, "LazyButtonActive", { fg = normal_bg, bg = accent, bold = true })
        vim.api.nvim_set_hl(0, "LazyProgressDone", { fg = accent })
    end,
})

-- ============================
-- User Commands for Batch Control
-- ============================

-- Install N plugins at a time
vim.api.nvim_create_user_command("LazyInstallBatch", function(opts)
  local count = tonumber(opts.args) or 5
  vim.notify("Installing " .. count .. " plugins at a time...", vim.log.levels.INFO)
  
  -- Temporarily set concurrency
  local lazy_config = require("lazy.core.config")
  local original = lazy_config.options.concurrency
  lazy_config.options.concurrency = count
  
  require("lazy").install({ wait = true })
  
  -- Restore original
  lazy_config.options.concurrency = original
end, { nargs = "?" })

-- Update N plugins at a time
vim.api.nvim_create_user_command("LazyUpdateBatch", function(opts)
  local count = tonumber(opts.args) or 5
  vim.notify("Updating " .. count .. " plugins at a time...", vim.log.levels.INFO)
  
  local lazy_config = require("lazy.core.config")
  local original = lazy_config.options.concurrency
  lazy_config.options.concurrency = count
  
  require("lazy").update({ wait = true })
  
  lazy_config.options.concurrency = original
end, { nargs = "?" })

-- Sync N plugins at a time
vim.api.nvim_create_user_command("LazySyncBatch", function(opts)
  local count = tonumber(opts.args) or 5
  vim.notify("Syncing " .. count .. " plugins at a time...", vim.log.levels.INFO)
  
  local lazy_config = require("lazy.core.config")
  local original = lazy_config.options.concurrency
  lazy_config.options.concurrency = count
  
  require("lazy").sync({ wait = true })
  
  lazy_config.options.concurrency = original
end, { nargs = "?" })

-- Set default batch size
vim.api.nvim_create_user_command("LazySetBatch", function(opts)
  local count = tonumber(opts.args) or 5
  require("lazy.core.config").options.concurrency = count
  vim.notify("Batch size set to: " .. count, vim.log.levels.INFO)
end, { nargs = 1 })

