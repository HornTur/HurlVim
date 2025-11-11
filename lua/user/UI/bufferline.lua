-- ─────────────────────────────────────────────
-- Enhanced Smart Bufferline
-- Features:
-- - Auto theme switching on colorscheme change
-- - Uses editor background for all buffers
-- - Visible separator lines between buffers
-- - Toggle globally with :GBT
-- - Responsive for all screen sizes
-- - Minimal diagnostic indicators [!]
-- - Dot indicators: Yellow (unsaved) → Green (saved)
-- - No italic text
-- - Bright text even with same background
-- - Optimized spacing and buffer management
-- ─────────────────────────────────────────────

local bufferline = require("bufferline")

-- ─────────────────────────────────────────────
-- Global toggle state
-- ─────────────────────────────────────────────
_G.bufferline_enabled = true

-- ─────────────────────────────────────────────
-- Color extraction from current theme
-- ─────────────────────────────────────────────
local function get_theme_colors()
  local function hl(name, attr)
    local ok, val = pcall(function()
      return vim.api.nvim_get_hl(0, { name = name })[attr]
    end)
    if ok and val then return string.format("#%06x", val) end
    return nil
  end

  -- Detect if theme is light or dark
  local function is_light_theme()
    local bg = vim.o.background
    return bg == "light"
  end

  -- Pure theme extraction - no hardcoded colors, no forcing
  local editor_bg = hl("Normal", "bg")
  local editor_fg = hl("Normal", "fg")
  
  -- Get theme colors naturally
  local selected_fg = hl("Function", "fg") or hl("Type", "fg") or hl("Keyword", "fg")
  local visible_fg = hl("Comment", "fg") or editor_fg
  local separator_fg = hl("VertSplit", "fg") or hl("WinSeparator", "fg") or hl("NonText", "fg")
  
  return {
    -- Pure editor background for all buffers
    bg = editor_bg,
    fg = editor_fg,
    
    -- Active buffer uses editor bg with vibrant theme text
    selected_bg = editor_bg,
    selected_fg = selected_fg,
    
    -- Visible but not active - use theme's comment color
    visible_bg = editor_bg,
    visible_fg = visible_fg,
    
    -- Diagnostic colors from theme
    error_fg = hl("DiagnosticError", "fg") or hl("Error", "fg"),
    warning_fg = hl("DiagnosticWarn", "fg") or hl("WarningMsg", "fg"),
    
    -- Modified indicators from theme
    modified_fg = hl("String", "fg") or hl("DiffAdd", "fg"),
    unsaved_fg = hl("WarningMsg", "fg") or hl("DiffChange", "fg"),
    
    -- Separators from theme
    separator = separator_fg,
    
    -- Close button from theme
    close_fg = hl("Error", "fg") or hl("DiagnosticError", "fg"),
  }
end

-- ─────────────────────────────────────────────
-- Custom diagnostic indicator
-- ─────────────────────────────────────────────
local function diagnostics_indicator(count, level, diagnostics_dict, context)
  if count > 0 then
    return " [!]"
  end
  return ""
end

-- ─────────────────────────────────────────────
-- Custom modified indicator (dot-based)
-- ─────────────────────────────────────────────
local function modified_indicator(buffer)
  if buffer.modified then
    return " ●"  -- Yellow dot for unsaved
  end
  return ""
end

-- ─────────────────────────────────────────────
-- Main setup function
-- ─────────────────────────────────────────────
local function setup_bufferline()
  local colors = get_theme_colors()
  
  if not _G.bufferline_enabled then
    -- Hide bufferline
    vim.o.showtabline = 0
    -- Clear bufferline display
    pcall(function()
      bufferline.setup({
        options = {
          always_show_bufferline = false,
        }
      })
    end)
    return
  end
  
  bufferline.setup({
    options = {
      mode = "buffers",
      themable = true,
      
      -- Separators (vertical lines between buffers)
      separator_style = { '│', '│' },  -- Thin vertical line separator
      
      -- Diagnostic settings
      diagnostics = "nvim_lsp",
      diagnostics_indicator = diagnostics_indicator,
      
      -- Close button
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      
      -- Icons and indicators
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      
      -- Better space management
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      
      -- Responsive sizing
      max_name_length = 18,
      tab_size = 18,
      truncate_names = true,
      
      -- Number style
      numbers = "none",
      
      -- Custom indicator icon
      indicator = {
        icon = '▎',
        style = 'icon',
      },
      
      -- Modified icon (custom dot)
      modified_icon = '●',
      
      -- Buffer management
      buffer_close_icon = '󰅖',
      close_icon = '󰅙',
      left_trunc_marker = '󰁍',
      right_trunc_marker = '󰁔',
      
      -- Offsets for file explorers
      offsets = {
        {
          filetype = "NvimTree",
          text = "󰙅 File Explorer",
          text_align = "center",
          separator = true,
        },
        {
          filetype = "neo-tree",
          text = "󰙅 File Explorer",
          text_align = "center",
          separator = true,
        },
      },
      
      -- Hover actions
      hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
      },
      
      -- Sorting
      sort_by = 'insert_after_current',
    },
    
    highlights = {
      -- Background (use editor bg)
      fill = {
        bg = colors.bg,
      },
      
      -- Tab line background
      background = {
        fg = colors.fg,
        bg = colors.bg,
      },
      
      -- Active/Selected buffer (no italic)
      buffer_selected = {
        fg = colors.selected_fg,
        bg = colors.selected_bg,
        bold = true,
        italic = false,
      },
      
      -- Visible but not selected
      buffer_visible = {
        fg = colors.visible_fg,
        bg = colors.visible_bg,
      },
      
      -- Modified indicator (yellow dot)
      modified = {
        fg = colors.unsaved_fg,
        bg = colors.bg,
      },
      modified_visible = {
        fg = colors.unsaved_fg,
        bg = colors.visible_bg,
      },
      modified_selected = {
        fg = colors.modified_fg,  -- Green when selected
        bg = colors.selected_bg,
        bold = true,
      },
      
      -- Diagnostic indicators (no italic)
      error = {
        fg = colors.error_fg,
        bg = colors.bg,
        italic = false,
      },
      error_selected = {
        fg = colors.error_fg,
        bg = colors.selected_bg,
        italic = false,
      },
      error_diagnostic = {
        fg = colors.error_fg,
        bg = colors.bg,
        italic = false,
      },
      error_diagnostic_selected = {
        fg = colors.error_fg,
        bg = colors.selected_bg,
        italic = false,
      },
      
      warning = {
        fg = colors.warning_fg,
        bg = colors.bg,
        italic = false,
      },
      warning_selected = {
        fg = colors.warning_fg,
        bg = colors.selected_bg,
        italic = false,
      },
      warning_diagnostic = {
        fg = colors.warning_fg,
        bg = colors.bg,
        italic = false,
      },
      warning_diagnostic_selected = {
        fg = colors.warning_fg,
        bg = colors.selected_bg,
        italic = false,
      },
      
      -- Separators (visible lines)
      separator = {
        fg = colors.separator,
        bg = colors.bg,
      },
      separator_selected = {
        fg = colors.separator,
        bg = colors.selected_bg,
      },
      separator_visible = {
        fg = colors.separator,
        bg = colors.visible_bg,
      },
      
      -- Indicator
      indicator_selected = {
        fg = colors.selected_fg,
        bg = colors.selected_bg,
      },
      
      -- Close button
      close_button = {
        fg = colors.fg,
        bg = colors.bg,
      },
      close_button_visible = {
        fg = colors.visible_fg,
        bg = colors.visible_bg,
      },
      close_button_selected = {
        fg = colors.close_fg,
        bg = colors.selected_bg,
      },
      
      -- Duplicate indicators (no italic)
      duplicate = {
        fg = colors.visible_fg,
        bg = colors.bg,
        italic = false,
      },
      duplicate_selected = {
        fg = colors.selected_fg,
        bg = colors.selected_bg,
        italic = false,
        bold = true,
      },
      duplicate_visible = {
        fg = colors.visible_fg,
        bg = colors.visible_bg,
        italic = false,
      },
      
      -- Tab indicators
      tab = {
        fg = colors.fg,
        bg = colors.bg,
      },
      tab_selected = {
        fg = colors.selected_fg,
        bg = colors.selected_bg,
      },
      tab_close = {
        fg = colors.close_fg,
        bg = colors.bg,
      },
    },
  })
  
  vim.o.showtabline = 2
  
  -- Set up keymaps after bufferline is configured
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Navigate buffers
  keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
  keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)

  -- Move buffers
  keymap("n", "<leader>bl", "<cmd>BufferLineMoveNext<CR>", opts)
  keymap("n", "<leader>bh", "<cmd>BufferLineMovePrev<CR>", opts)

  -- Pick buffer
  keymap("n", "<leader>bp", "<cmd>BufferLinePick<CR>", opts)

  -- Close buffers
  keymap("n", "<leader>bc", function()
    require("bufferline").pick_buffer()
    vim.defer_fn(function()
      vim.cmd("bdelete")
    end, 100)
  end, { desc = "Pick buffer to close" })
  
  keymap("n", "<leader>bk", function()
    local bufferline_commands = require("bufferline.commands")
    bufferline_commands.close_buffer_with_pick()
  end, { desc = "Pick and close buffer" })
  
  keymap("n", "<leader>bx", "<cmd>bdelete<CR>", opts)

  -- Close all but current
  keymap("n", "<leader>bo", function()
    local bufferline_commands = require("bufferline.commands")
    bufferline_commands.close_others()
  end, { desc = "Close other buffers" })

  -- Close left/right
  keymap("n", "<leader>bL", function()
    local bufferline_commands = require("bufferline.commands")
    bufferline_commands.close_in_direction("left")
  end, { desc = "Close buffers to the left" })
  
  keymap("n", "<leader>bR", function()
    local bufferline_commands = require("bufferline.commands")
    bufferline_commands.close_in_direction("right")
  end, { desc = "Close buffers to the right" })

  -- Pin/unpin buffer
  keymap("n", "<leader>bP", function()
    local bufferline_commands = require("bufferline.commands")
    bufferline_commands.toggle_pin()
  end, { desc = "Toggle buffer pin" })

  -- Go to buffer by number
  for i = 1, 9 do
    keymap("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", opts)
  end
end

-- ─────────────────────────────────────────────
-- Auto-refresh on colorscheme change
-- ─────────────────────────────────────────────
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("BufferlineThemeSync", { clear = true }),
  callback = function()
    vim.defer_fn(setup_bufferline, 100)
  end,
})

-- ─────────────────────────────────────────────
-- Toggle command :GBT (Global Bufferline Toggle)
-- ─────────────────────────────────────────────
vim.api.nvim_create_user_command("GBT", function()
  _G.bufferline_enabled = not _G.bufferline_enabled
  
  if _G.bufferline_enabled then
    -- Re-enable and refresh
    setup_bufferline()
    vim.cmd('redraw')
    print("✓ Bufferline enabled")
  else
    -- Disable
    vim.o.showtabline = 0
    pcall(function()
      bufferline.setup({
        options = {
          always_show_bufferline = false,
        }
      })
    end)
    vim.cmd('redraw')
    print("✗ Bufferline disabled")
  end
end, { desc = "Toggle bufferline globally" })

-- ─────────────────────────────────────────────
-- Manual refresh command
-- ─────────────────────────────────────────────
vim.api.nvim_create_user_command("BufferlineRefresh", setup_bufferline, {
  desc = "Manually refresh bufferline theme"
})

-- Initial setup
setup_bufferline()
