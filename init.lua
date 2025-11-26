-- ============================
-- Neovim Init File
-- ============================

-- ----------------------------
-- Safe Require Helper
-- ----------------------------
local function safe_require(module)
    local ok, result = pcall(require, module)
    if not ok then
        vim.notify(
            "Failed to load: " .. module .. "\n" .. tostring(result),
            vim.log.levels.ERROR,
            { title = "Module Load Error" }
        )
        return nil
    end
    return result
end

-- ============= ============= ============= =============
-- 1. BASIC SETTINGS CORE
-- ============= ============= ============= =============
safe_require("user.UI.NoMoreItalics")
safe_require("user.Basics.env")
safe_require("user.Basics.options")
safe_require("user.Basics.mappings")
safe_require("user.Basics.autoreload")
safe_require("user.Basics.plugins")
safe_require("user.Basics.utilities")

-- ============= ============= ============= =============
--  2. UI CORE (Overridden)
-- ============= ============= ============= =============

safe_require("user.UI.custom_treesitters")
safe_require("user.UI.dashboard")
safe_require("user.UI.DAP_UI")
safe_require("user.UI.diagonasticsigns")
safe_require("user.UI.IBL")
safe_require("user.UI.bufferline")
safe_require("user.UI.gitsigns")
safe_require("user.UI.statusline")
safe_require("user.UI.dressing")
safe_require("user.UI.windows")
-- safe_require("user.UI.snacks") backup only for mini.notify
safe_require("user.UI.bold_text")
safe_require("user.Overridder.Caller")
safe_require("user.Overridder.gruvbox_ts")
safe_require("user.UI.theme")
safe_require("user.UI.colors")
safe_require("user.UI.SetGlobalTheme")
safe_require("user.UI.notify")

-- ============= ============= ============= =============
-- 6. Mini Ecosystem
-- ============= ============= ============= =============
safe_require("user.Mini.mini_surround")
safe_require("user.Mini.mini_notify")


-- ============= ============= ============= =============
-- 3. BATCH PLUGIN CORE
-- ============= ============= ============= =============

safe_require("user.config.LspBatch.lsp")
safe_require("user.config.LspBatch.cmp")
safe_require("user.config.LspBatch.autopairs")
safe_require("user.config.LspBatch.formatter")

safe_require("user.config.IdeBatch.nvimtree")
safe_require("user.config.IdeBatch.telescope")
safe_require("user.config.IdeBatch.toggleterm")
safe_require("user.config.IdeBatch.workspace")
safe_require("user.config.IdeBatch.sessions")
safe_require("user.config.LspBatch.trouble")
safe_require("user.config.IdeBatch.harpoon")
safe_require("user.config.IdeBatch.snipe")
safe_require("user.config.IdeBatch.todo")
safe_require("user.config.IdeBatch.sessions")
safe_require("user.config.IdeBatch.whkey")
safe_require("user.config.IdeBatch.multiselect")
safe_require("user.config.IdeBatch.treesitter")
safe_require("user.config.IdeBatch.showkey")
safe_require("user.config.IdeBatch.surround")
safe_require("user.config.IdeBatch.oil")
safe_require("user.config.LspBatch.luasnip")

-- ============= ============= ============= =============
-- 4. PluginExtensionConfiguration
-- ============= ============= ============= =============
safe_require("user.PluginExtensionConfiguration.overseer")


-- ============= ============= ============= =============
-- 6. Custom Cmp
-- ============= ============= ============= =============

-- NOTE: Please uncomment this only when working on Gdscript !
-- NOTE: IS CURRENTLY IN NON-PRODUCTION READY BUT WORKING STATE !

-- safe_require("user.CustomCmp.cmp-gd")


-- ============= ============= ============= ============= =============
-- Don't uncommemt until the above ones behave different
-- ============= ============= ============= ============= =============

-- safe_require("user.UI.dressing")
-- safe_require("user.UI.windows")
-- safe_require("user.UI.snacks")
-- safe_require("user.UI.bold_text")
-- safe_require("user.Overridder.Caller")
-- safe_require("user.Overridder.gruvbox_ts")
-- safe_require("user.UI.theme")
-- safe_require("user.UI.colors")
-- safe_require("user.UI.SetGlobalTheme")

-- ============= ============= ============= ============= =============
-- Colorscheme Calls Only
-- ============= ============= ============= ============= =============

-- Uncomment this to use gruvbox
-- vim.cmd.colorscheme("nordfox")

-- Comment this if you don't like
vim.g.gruvbox_material_background = "hard"     -- options: soft | medium | hard
vim.g.gruvbox_material_foreground = "material" -- options: material | mix | original
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_ui_contrast = "low"        -- options: low | high
vim.g.gruvbox_material_transparent_background = 0 -- set to 1 for transparent

-- Finally, load the colorscheme
vim.cmd.colorscheme("nordfox")
