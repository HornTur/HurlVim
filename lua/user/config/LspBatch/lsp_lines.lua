require("lsp_lines").setup({
    virtual_lines = {
        only_current_line = true,
        highlight_whole_line = false,
    },
})

-- Start with diagnostics DISABLED by default
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,   -- Disabled by default
    severity_sort = true,
})

-- State tracking for toggles - BOTH DISABLED BY DEFAULT
local popup_enabled = false
local inline_enabled = false

-- Floating window for diagnostics
local float_win = nil
local float_buf = nil
local original_win = nil

local function close_float()
    if float_win and vim.api.nvim_win_is_valid(float_win) then
        vim.api.nvim_win_close(float_win, true)
        float_win = nil
        original_win = nil
    end
end

local function show_diagnostics_float()
    -- Don't show if popup is disabled
    if not popup_enabled then
        return
    end

    close_float()

    -- Store the original window
    original_win = vim.api.nvim_get_current_win()

    -- Get ALL diagnostics for the current line
    local diagnostics = vim.diagnostic.get(0, {
        lnum = vim.fn.line(".") - 1,
    })

    if #diagnostics == 0 then return end

    -- Build single-line messages with all diagnostic types
    local lines = {}
    local max_msg_length = 0

    -- Sort by severity (ERROR, WARN, INFO, HINT)
    table.sort(diagnostics, function(a, b)
        return a.severity < b.severity
    end)

    -- LIMIT TO 3 ERRORS ONLY
    local max_diagnostics = math.min(#diagnostics, 3)

    for i = 1, max_diagnostics do
        local diag = diagnostics[i]
        local severity_name = vim.diagnostic.severity[diag.severity]:lower()
        local message = diag.message:gsub("\n", " ")
        local line = string.format("[%s] %s", severity_name, message)
        table.insert(lines, line)
        max_msg_length = math.max(max_msg_length, #line)
    end

    -- Add indicator if there are more diagnostics
    if #diagnostics > 3 then
        local more_line = string.format("... and %d more diagnostic(s)", #diagnostics - 3)
        table.insert(lines, more_line)
        max_msg_length = math.max(max_msg_length, #more_line)
    end

    if #lines == 0 then return end

    -- Create buffer if it doesn't exist
    if not float_buf or not vim.api.nvim_buf_is_valid(float_buf) then
        float_buf = vim.api.nvim_create_buf(false, true)
    end

    vim.api.nvim_set_option_value('modifiable', true, { buf = float_buf })
    vim.api.nvim_buf_set_lines(float_buf, 0, -1, false, lines)
    vim.api.nvim_set_option_value('modifiable', false, { buf = float_buf })

    -- MAXIMUM constraints
    local MAX_WIDTH = 80
    local MAX_HEIGHT = 12

    -- Smart width calculation
    local screen_width = vim.o.columns
    local min_width = 40
    local max_width = math.min(math.floor(screen_width * 0.5), MAX_WIDTH)
    local ideal_width = math.min(max_msg_length + 2, max_width)
    local width = math.max(min_width, ideal_width)

    -- Smart height calculation
    local min_height = 3
    local ideal_height = #lines
    local height = math.max(min_height, math.min(ideal_height, MAX_HEIGHT))

    local opts = {
        relative = "editor",
        width = width,
        height = height,
        row = vim.o.lines - height - 3,
        col = 0,
        style = "minimal",
        border = "rounded",
        focusable = true,
        noautocmd = true,
    }

    float_win = vim.api.nvim_open_win(float_buf, false, opts)

    -- Enable line wrapping and scrolling
    vim.api.nvim_set_option_value('wrap', true, { win = float_win })
    vim.api.nvim_set_option_value('linebreak', true, { win = float_win })
    vim.api.nvim_set_option_value('breakindent', true, { win = float_win })
    vim.api.nvim_set_option_value('scrolloff', 2, { win = float_win })
    vim.api.nvim_set_option_value('cursorline', true, { win = float_win })

    -- Set up j/k for scrolling
    vim.api.nvim_buf_set_keymap(float_buf, 'n', 'j', '', {
        noremap = true,
        silent = true,
        callback = function()
            if float_win and vim.api.nvim_win_is_valid(float_win) then
                local current_win = vim.api.nvim_get_current_win()
                if current_win == float_win then
                    vim.cmd('normal! j')
                end
            end
        end,
    })

    vim.api.nvim_buf_set_keymap(float_buf, 'n', 'k', '', {
        noremap = true,
        silent = true,
        callback = function()
            if float_win and vim.api.nvim_win_is_valid(float_win) then
                local current_win = vim.api.nvim_get_current_win()
                if current_win == float_win then
                    vim.cmd('normal! k')
                end
            end
        end,
    })

    -- Set up escape keymaps to return to main window
    vim.api.nvim_buf_set_keymap(float_buf, 'n', '<Esc>', '', {
        noremap = true,
        silent = true,
        callback = function()
            if original_win and vim.api.nvim_win_is_valid(original_win) then
                vim.api.nvim_set_current_win(original_win)
            end
        end,
    })

    vim.api.nvim_buf_set_keymap(float_buf, 'n', 'q', '', {
        noremap = true,
        silent = true,
        callback = function()
            close_float()
            if original_win and vim.api.nvim_win_is_valid(original_win) then
                vim.api.nvim_set_current_win(original_win)
            end
        end,
    })
end

-- Focus the diagnostic float window
local function focus_diagnostics_float()
    if float_win and vim.api.nvim_win_is_valid(float_win) then
        vim.api.nvim_set_current_win(float_win)
    else
        vim.notify("No diagnostic window open", vim.log.levels.WARN)
    end
end

-- Show diagnostics float on cursor hold (ONLY in normal mode)
vim.api.nvim_create_autocmd("CursorHold", {
    callback = show_diagnostics_float,
})

-- Disable lsp_lines in insert mode if inline is enabled
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        if inline_enabled then
            vim.diagnostic.config({ virtual_lines = false })
        end
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        if inline_enabled then
            vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
        end
    end,
})

-- Close float ONLY when moving cursor AND we're in the original/main buffer
vim.api.nvim_create_autocmd({ "CursorMoved" }, {
    callback = function()
        local current_win = vim.api.nvim_get_current_win()
        local current_buf = vim.api.nvim_get_current_buf()

        -- Only close if:
        -- 1. We're NOT in the float window
        -- 2. We're NOT in the float buffer
        if float_win and current_win ~= float_win and current_buf ~= float_buf then
            close_float()
        end
    end,
})

-- Close on insert mode cursor movement (but only in non-float buffers)
vim.api.nvim_create_autocmd({ "CursorMovedI" }, {
    callback = function()
        local current_win = vim.api.nvim_get_current_win()
        local current_buf = vim.api.nvim_get_current_buf()

        if float_win and current_win ~= float_win and current_buf ~= float_buf then
            close_float()
        end
    end,
})

-- Reduce the delay before CursorHold triggers
vim.opt.updatetime = 500

-- Toggle inline diagnostics (lsp_lines) with <leader>ri
vim.keymap.set("n", "<leader>ri", function()
    inline_enabled = not inline_enabled
    if inline_enabled then
        vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
        vim.notify("Inline diagnostics enabled", vim.log.levels.INFO)
    else
        vim.diagnostic.config({ virtual_lines = false })
        vim.notify("Inline diagnostics disabled", vim.log.levels.INFO)
    end
end, { desc = "Toggle inline diagnostics (lsp_lines)" })

-- Toggle popup diagnostics with <leader>rp
vim.keymap.set("n", "<leader>rp", function()
    popup_enabled = not popup_enabled
    if popup_enabled then
        vim.notify("Popup diagnostics enabled", vim.log.levels.INFO)
        -- Trigger popup immediately if on a line with diagnostics
        show_diagnostics_float()
    else
        vim.notify("Popup diagnostics disabled", vim.log.levels.INFO)
        close_float()
    end
end, { desc = "Toggle popup diagnostics" })

-- Toggle ALL diagnostics with <leader>ra
vim.keymap.set("n", "<leader>ra", function()
    -- If either is enabled, disable both
    if inline_enabled or popup_enabled then
        inline_enabled = false
        popup_enabled = false
        vim.diagnostic.config({ virtual_lines = false })
        close_float()
        vim.notify("All diagnostics disabled", vim.log.levels.INFO)
    else
        -- Enable both
        inline_enabled = true
        popup_enabled = true
        vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
        vim.notify("All diagnostics enabled", vim.log.levels.INFO)
        show_diagnostics_float()
    end
end, { desc = "Toggle all diagnostics" })

-- Focus diagnostic window with <leader>rf
vim.keymap.set("n", "<leader>rf", focus_diagnostics_float, { desc = "Focus diagnostic window" })
