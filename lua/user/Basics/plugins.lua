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

        -- ===========================
        -- Plugin Managers
        -- ===========================
        { "mason-org/mason.nvim",           opts = {} },
        { "williamboman/mason.nvim",        build = ":MasonUpdate",           event = "VeryLazy", },

        -- ===========================
        -- dependencies
        -- ===========================
        { "nvim-lua/plenary.nvim",          "nvim-treesitter/nvim-treesitter" },
        { "MunifTanjim/nui.nvim" },
        { "theHamsta/nvim-dap-virtual-text" },
        { "rafamadriz/friendly-snippets" },
        { "stevearc/overseer.nvim" },
        {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            'hrsh7th/cmp-cmdline',
        },

        { "nvim-lua/plenary.nvim",       lazy = true },
        { "nvim-tree/nvim-web-devicons", lazy = true },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
        { 'hrsh7th/cmp-cmdline' },
        { "mfussenegger/nvim-dap" },
        { "nvim-neotest/nvim-nio" }, -- dependency
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/plenary.nvim",       "nvim-treesitter/nvim-treesitter" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "honza/vim-snippets",          lazy = true },
        { "MunifTanjim/nui.nvim" },

        {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",

            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-telescope/telescope-fzy-native.nvim" },
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-project.nvim",
            "jvgrootveld/telescope-zoxide",
            "debugloop/telescope-undo.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
        },


        -- ===========================
        -- UI
        -- ===========================
        --        { "folke/snacks.nvim",                   version = "*", lazy = false, },
        --        { "folke/noice.nvim" },
        { "echasnovski/mini.icons",              version = false,                        lazy = true, },
        { "stevearc/dressing.nvim" },
        { "beauwilliams/focus.nvim" },
        { "rcarriga/nvim-notify" },
        { "nvim-treesitter/nvim-treesitter",     build = ":TSUpdate" },
        { "lukas-reineke/indent-blankline.nvim", main = "ibl",                           event = { "BufReadPost", "BufNewFile" } },
        { "akinsho/bufferline.nvim",             version = "*",                          event = "VeryLazy", },
        { "nvim-tree/nvim-tree.lua",             version = "*", },
        { "hrsh7th/nvim-cmp" },
        { "windwp/nvim-autopairs",               event = "InsertEnter" },
        { "kylechui/nvim-surround",              event = "VeryLazy",                     config = true },
        { "stevearc/conform.nvim",               event = "BufWritePre" },
        { "nvim-lualine/lualine.nvim" },
        { "mfussenegger/nvim-dap" },
        { "rcarriga/nvim-dap-ui" },
        { "goolord/alpha-nvim",                  event = "VimEnter", },
        { "MaximilianLloyd/ascii.nvim" },


        -- =========================
        -- Lsp Only
        -- =========================
        { "neovim/nvim-lspconfig",               event = { "BufReadPre", "BufNewFile" }, },
        { "L3MON4D3/LuaSnip",                    lazy = true },
        { "akinsho/toggleterm.nvim",             version = "*" },
        { "folke/trouble.nvim",                  branch = "main", },
        { "folke/todo-comments.nvim" },
        { "ThePrimeagen/refactoring.nvim" },
        { "mfussenegger/nvim-dap" },
        { "onsails/lspkind-nvim" },
        { "SmiteshP/nvim-navic",                 lazy = true },
        { "L3MON4D3/LuaSnip",                    version = "v2.*",                       build = "make install_jsregexp" },
        { "saghen/blink.cmp",                    version = "*" },

        -- =========================
        -- Sessions & workspace
        -- =========================
        { "stevearc/resession.nvim" },
        { "rmagatti/auto-session" },
        { "natecraddock/workspaces.nvim" },
        { "ahmedkhalf/project.nvim" },

        -- =========================
        -- Daily usefull
        -- =========================
        { "folke/which-key.nvim",                event = "VeryLazy", },
        { "karb94/neoscroll.nvim",               config = true },
        { "mg979/vim-visual-multi",              branch = "master" },
        { 'numToStr/Comment.nvim' },
        { "kdheepak/lazygit.nvim" },
        { "echasnovski/mini.nvim",               version = "*" },
        { "nvzone/showkeys" },

        -- =========================
        -- File Search
        -- =========================
        { "ThePrimeagen/harpoon",                branch = "harpoon2" },
        { "nvim-telescope/telescope.nvim",       tag = "0.1.5" },
        { "nvim-neo-tree/neo-tree.nvim",         branch = "v3.x" },
        { "leath-dub/snipe.nvim" },
        { "otavioschwanck/arrow.nvim", },
        {
            'stevearc/oil.nvim',
            ---@module 'oil'
            ---@type oil.SetupOpts
            opts = {},
            -- Optional dependencies
            dependencies = { { "nvim-mini/mini.icons", opts = {} } },
            lazy = false,
        },
        -- =========================
        -- Colorscheme
        -- =========================
        { "ellisonleao/gruvbox.nvim",        name = "gruvbox-ellison" },
        { "projekt0n/github-nvim-theme",     name = "github-theme" },
        { "lunarvim/colorschemes" }, -- LunarVim’s default colorscheme collection
        { "folke/tokyonight.nvim" },
        { "catppuccin/nvim",                 name = "catppuccin" },
        { "EdenEast/nightfox.nvim" },
        { "shaunsingh/nord.nvim" },
        { "Mofiqul/vscode.nvim" },
        { "navarasu/onedark.nvim" },
        { "rebelot/kanagawa.nvim" },
        { "chriskempson/vim-tomorrow-theme" },
        { "rose-pine/neovim",                name = "rose-pine" },
        { "sainnhe/everforest",              name = "everforest" },
        { "sainnhe/gruvbox-material",        name = "gruvbox-material-sainnhe" },
        { "sainnhe/sonokai",                 name = "sonokai-sainnhe" },
        { "tiagovla/tokyodark.nvim",         name = "tokyodark-tiagovla" },
        { "savq/melange-nvim",               name = "melange-warm-savq" },
        { "rmehri01/onenord.nvim",           name = "onenord-rmehri01" },
        { "olivercederborg/poimandres.nvim", name = "poimanders.nvim" },
        { "AlexvZyl/nordic.nvim",            name = "nordic-Alexy" },
        { "NvChad/nvim-base16.lua" }, -- Define yourself
        { "luisiacc/gruvbox-baby",           name = "gruvbox-baby" },
        { "ribru17/bamboo.nvim",             name = "bamboo" },
        { "Biscuit-Theme/nvim",              name = "biscuit" },

        -- NOTE: STAY BEHIND THIS !
    },               -- NOTE: Closing brace for spec table!!!!!!

    concurrency = 5, -- ONLY 5 plugins download at once
    -- Adjust: 3=slow, 5=balanced, 10=fast, 20=very fast
    -- This is the ONLY setting that limits CPU stress

    git = {
        timeout = 300, -- Timeout for git operations
        url_format = "https://github.com/%s.git",
    },

    -- ============================
    -- Everything Else Stays Normal
    -- ============================
    install = {
        missing = true,
    },

    checker = {
        enabled = true,   -- Keep auto-check enabled
        notify = true,    -- Keep notifications
        frequency = 3600, -- Check every hour
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
        border = "rounded", -- "none", "single", "double", "shadow"
        size = { width = 0.88, height = 0.9 },
        wrap = false,
        title = "   Lazy Plugin Manager ",
        backdrop = 70, -- 0–100 (transparency)
        icons = {
            cmd        = " ", -- nf-md-terminal
            config     = " ", -- nf-fa-gear
            event      = " ", -- nf-fa-calendar
            ft         = " ", -- nf-fa-file_text_o
            init       = "⚙️ ",
            import     = " ", -- nf-oct-package
            keys       = " ", -- nf-fa-keyboard_o
            lazy       = "󰒲 ", -- nf-md-sleep
            loaded     = " ", -- nf-fa-check_circle
            not_loaded = " ", -- nf-fa-circle_thin
            plugin     = " ", -- nf-oct-package
            runtime    = " ", -- nf-dev-vim
            source     = " ", -- nf-fa-code
            start      = " ", -- nf-fa-rocket
            task       = " ", -- nf-fa-tasks
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
