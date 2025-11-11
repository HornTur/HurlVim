-- Real-time Diagnostic Configuration
-- Shows diagnostic signs immediately, but popup only in Normal mode

vim.diagnostic.config({
  -- Update diagnostics in INSERT mode (keeps signs/gutter updated)
  update_in_insert = true,
  -- Show diagnostics immediately
  severity_sort = true,
  -- DISABLE virtual text (no inline diagnostics)
  virtual_text = false,
  -- Signs in the gutter (side column)
  signs = {
    text = {
         [vim.diagnostic.severity.ERROR] = "✘ ",
         [vim.diagnostic.severity.WARN] = "⚠ ",
         [vim.diagnostic.severity.HINT] = "󰌶 ",
         [vim.diagnostic.severity.INFO] = " "
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
  },

  -- Floating window on cursor hover
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = true,
    header = "⚠ Diagnostic Report",
    prefix = " ",
  },
  -- Underline (optional, set to false if you don't want underlines)
  underline = true,
})

-- Auto-show diagnostics ONLY in Normal mode (not Insert mode)
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    -- Only show popup if we're in Normal mode
    local mode = vim.api.nvim_get_mode().mode
    if mode == 'n' then
      vim.diagnostic.open_float(nil, {
        focus = false,
        scope = "cursor",
      })
    end
  end,
})

-- Reduce delay for cursor hold (default is 4000ms)
vim.opt.updatetime = 300 -- 300ms delay for faster diagnostic display

-- Optional: Show diagnostics count in statusline
vim.api.nvim_create_autocmd({ "DiagnosticChanged", "BufEnter" }, {
  pattern = "*",
  callback = function()
    local diagnostics = vim.diagnostic.get(0)
    local count = { error = 0, warn = 0, info = 0, hint = 0 }
    for _, diagnostic in ipairs(diagnostics) do
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        count.error = count.error + 1
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        count.warn = count.warn + 1
      elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        count.info = count.info + 1
      elseif diagnostic.severity == vim.diagnostic.severity.HINT then
        count.hint = count.hint + 1
      end
    end
    vim.b.diagnostic_count = count
  end,
})

-- LSP Configuration for instant diagnostic signs in column
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      -- Force diagnostic signs to update immediately on any text change
      vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "TextChangedP" }, {
        buffer = args.buf,
        callback = function()
          -- Refresh diagnostic signs in column immediately
          vim.diagnostic.show(nil, args.buf)
        end,
      })
      -- Also update on mode change
      vim.api.nvim_create_autocmd({ "ModeChanged" }, {
        buffer = args.buf,
        callback = function()
          vim.diagnostic.show(nil, args.buf)
        end,
      })
    end
  end,
})


-- Force Neovim background to Gruvbox color
vim.opt.background = "dark"
local bg_color = "#282828" -- Gruvbox dark default

-- Override Normal highlight (main UI)
vim.api.nvim_set_hl(0, "Normal", { bg = bg_color, fg = "#ebdbb2" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = bg_color })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg_color })
vim.api.nvim_set_hl(0, "VertSplit", { bg = bg_color })
vim.api.nvim_set_hl(0, "StatusLine", { bg = bg_color })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = bg_color })

-- Diagnostic sign colors for better visibility
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#fb4934", bg = bg_color })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#fabd2f", bg = bg_color })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#8ec07c", bg = bg_color })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#83a598", bg = bg_color })

-- Virtual text colors
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#fb4934", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#fabd2f", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#8ec07c", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#83a598", italic = true })

-- Optional: Keybindings for quick diagnostic navigation
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic quickfix' })
