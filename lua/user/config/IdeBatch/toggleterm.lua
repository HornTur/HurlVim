-- =====================
-- ToggleTerm Setup (Termux Optimized, Locked Insert)
-- =====================
require("toggleterm").setup({
    size = 15,
    open_mapping = [[<C-Space>]],
    shade_terminals = true,
    direction = "horizontal",
    start_in_insert = true,
    persist_size = true,
    close_on_exit = false,
    shell = vim.o.shell,
})

-- =====================
-- Force terminal to always stay in insert mode
-- =====================
vim.api.nvim_create_autocmd({
    "TermOpen", "BufEnter", "WinEnter", "BufWinEnter", "VimResized",
}, {
    pattern = "term://*",
    callback = function()
        pcall(function()
            if vim.bo.buftype == "terminal" then
                vim.cmd("startinsert!")
            end
        end)
    end,
})

-- =====================
-- Terminal-specific jail settings
-- =====================
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "term://*",
    callback = function()
        -- Enter insert on open
        vim.cmd("startinsert!")

        -- 🔒 Disable mouse/touch completely
--        vim.opt_local.mouse = ""
--      vim.opt_local.number = false
--      vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"

        -- ⌨️ Keymaps (buffer local)
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = 0 })   -- manual escape
        vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:q<CR>]], { buffer = 0 }) -- quit terminal

        -- 🚨 Lock terminal: auto-snap back to insert if leaving it
        vim.api.nvim_create_autocmd("ModeChanged", {
            buffer = 0,
            callback = function()
                local mode = vim.fn.mode()
                if mode ~= "i" and mode ~= "t" then
                    vim.cmd("startinsert!")
                end
            end,
        })
    end,
})
