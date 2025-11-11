local harpoon = require("harpoon")

-- UI
vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon: Toggle menu" })

-- Add current file
vim.keymap.set("n", "<C-a>", function()
    harpoon:list():add()
end, { desc = "Harpoon: Add file" })

