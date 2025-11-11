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

-- ----------------------------
-- 1. Basic Settings
-- ----------------------------
safe_require("user.Basics.env")
safe_require("user.Basics.options")
safe_require("user.Basics.mappings")
safe_require("user.Basics.autoreload")
safe_require("user.Basics.plugins")
safe_require("user.Basics.utilities")
safe_require("user.UI.treesitters")

-- ---------------------------
-- 2. UI Enhancements (Overridden)
-- ----------------------------
safe_require("user.UI.dashboard")
safe_require("user.UI.DAP_UI")
safe_require("user.UI.diagonasticsigns")
safe_require("user.UI.IBL")
safe_require("user.UI.bufferline")
safe_require("user.UI.gitsigns")
safe_require("user.UI.statusline")

-- ----------------------------
-- 3. Plugin Configurations
-- ----------------------------
safe_require("user.config.LspBatch.lsp")
safe_require("user.config.LspBatch.cmp")
safe_require("user.config.LspBatch.autopairs")
safe_require("user.config.LspBatch.formattor")
safe_require("user.UI.notify") -- Don't change the location from line 50.
safe_require("user.config.IdeBatch.nvimtree")
safe_require("user.config.IdeBatch.telescope")
safe_require("user.config.IdeBatch.toggleterm")
safe_require("user.config.IdeBatch.workspace")
safe_require("user.config.IdeBatch.sessions")

-- ----------------------------
-- 4. Custom Plugin Configs
-- ----------------------------
safe_require("user.config.LspBatch.trouble")
safe_require("user.config.IdeBatch.harpoon")
safe_require("user.config.IdeBatch.snipe")
safe_require("user.config.IdeBatch.todo")
safe_require("user.config.IdeBatch.sessions")
safe_require("user.config.IdeBatch.legendarynvim")
safe_require("user.config.IdeBatch.multiselect")
safe_require("user.config.IdeBatch.legendary")
safe_require("user.config.LspBatch.luasnip")

-- --------------------------
-- Over Ride Plugins here
-- --------------------------
safe_require("user.UI.dressing")
safe_require("user.UI.noice")
safe_require("user.UI.windows")

-- ----------------------------------
-- Inbuilt Plugins for Better Life
-- ----------------------------------
safe_require("user.Inbuilt.luanmulti")
safe_require("user.Inbuilt.comment")

-- -----------------------------
-- This is Reserved
-- -----------------------------
safe_require("user.UI.snacks")
safe_require("user.UI.bold_text")
safe_require("user.UI.theme")
safe_require("user.UI.colors")
safe_require("user.UI.SetGlobalTheme")

vim.cmd.colorscheme("vscode")

