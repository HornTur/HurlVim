-- =====================
-- Workspaces
-- =====================
require("workspaces").setup({
    hooks = {
        open = { "NvimTreeOpen" },
    },
})

-- Keymaps
vim.keymap.set("n", "<leader>ps", ":SessionSave<CR>", { desc = "Save Session" })
vim.keymap.set("n", "<leader>pr", ":SessionRestore<CR>", { desc = "Restore Session" })
