-- Autosave configuration for Neovim
-- Disabled by default, toggle with <leader>as

-- Create a global variable to track autosave state
vim.g.autosave_enabled = false

-- Function to save all modified buffers
local function autosave()
    if vim.g.autosave_enabled then
        -- Save all modified buffers
        vim.cmd('silent! wall')
    end
end

-- Function to toggle autosave
local function toggle_autosave()
    vim.g.autosave_enabled = not vim.g.autosave_enabled
    if vim.g.autosave_enabled then
        print("✓ Autosave enabled")
    else
        print("✗ Autosave disabled")
    end
end

-- Set up autocommand for autosaving
local autosave_group = vim.api.nvim_create_augroup("AutoSave", { clear = true })

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    group = autosave_group,
    pattern = "*",
    callback = autosave,
})

-- Optional: Also autosave when focus is lost
vim.api.nvim_create_autocmd("FocusLost", {
    group = autosave_group,
    pattern = "*",
    callback = autosave,
})

-- Set up the toggle keybinding
vim.keymap.set('n', '<leader>as', toggle_autosave, {
    noremap = true,
    silent = true,
    desc = "Toggle autosave"
})

-- Optional: Show autosave status in the command line
vim.api.nvim_create_user_command('AutosaveStatus', function()
    if vim.g.autosave_enabled then
        print("Autosave is currently ENABLED")
    else
        print("Autosave is currently DISABLED")
    end
end, {})
