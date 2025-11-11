-- ═══════════════════════════════════════════════════════════
-- SNACKS.NVIM - Modern UI Components Configuration
-- ═══════════════════════════════════════════════════════════

local status_ok, snacks = pcall(require, "snacks")
if not status_ok then
  return
end

-- ═══════════════════════════════════════════════════════════
-- THEME-AWARE COLOR PALETTE
-- ═══════════════════════════════════════════════════════════
local function get_colors()
  local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or "#1e1e2e"
  local fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg or "#cdd6f4"
  
  return {
    bg = bg,
    fg = fg,
    accent = "#89b4fa",      -- Blue
    success = "#a6e3a1",     -- Green
    warning = "#f9e2af",     -- Yellow
    error = "#f38ba8",       -- Red
    info = "#89dceb",        -- Cyan
    purple = "#cba6f7",      -- Purple
    teal = "#94e2d5",        -- Teal
    orange = "#fab387",      -- Orange
    muted = "#585b70",       -- Gray
    highlight = "#45475a",   -- Surface
  }
end

snacks.setup({
  -- ═══════════════════════════════════════════════════════════
  -- NOTIFICATIONS - Custom notifier system
  -- ═══════════════════════════════════════════════════════════
  notifier = {
    enabled = true,
    timeout = 3000,           -- Default timeout in ms
    width = { min = 40, max = 0.4 },
    height = { min = 1, max = 0.6 },
    margin = { top = 0, right = 1, bottom = 0 },
    padding = true,
    sort = { "level", "added" },  -- Sort by level, then time added
    level = vim.log.levels.TRACE,
    icons = {
      error = " ",
      warn = " ",
      info = " ",
      debug = " ",
      trace = "✎ ",
    },
    keep = function(notif)
      return vim.fn.getcmdpos() > 0
    end,
    style = "compact",        -- compact, minimal, fancy
    top_down = false,         -- Show from bottom to top
    date_format = "%R",       -- Time format
    refresh = 50,             -- Refresh rate in ms
    
    -- Modern styling
    styles = {
      notification = {
        border = "rounded",
        zindex = 100,
        ft = "markdown",
        wo = {
          winblend = 10,
          wrap = true,
          conceallevel = 2,
          colorcolumn = "",
        },
        bo = { filetype = "snacks_notif" },
      },
      
      notification_history = {
        border = "rounded",
        zindex = 100,
        width = 0.6,
        height = 0.6,
        minimal = false,
        title = "Notification History",
        title_pos = "center",
        ft = "markdown",
        wo = {
          winblend = 5,
          winhighlight = "Normal:SnacksNotifierHistory,FloatBorder:SnacksNotifierHistoryBorder",
        },
      },
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- INPUT PROMPTS - Floating input dialogs
  -- ═══════════════════════════════════════════════════════════
  input = {
    enabled = false,
    icon = " ",
    icon_hl = "SnacksInputIcon",
    icon_pos = "left",
    prompt_pos = "title",
    win = {
      relative = "editor",
      position = "50%",
      border = "rounded",
      title_pos = "center",
      height = 1,
      width = 60,
      row = 2,
      wo = {
        winblend = 10,
        winhighlight = "Normal:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
        cursorline = false,
      },
      bo = {},
    },
    expand = true,
    enter = true,
    backdrop = {
      enabled = true,
      bg = "#000000",
      blend = 60,
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- PICKER / SELECTION MENUS - Buffer & item pickers
  -- ═══════════════════════════════════════════════════════════
  picker = {
    enabled = true,
    layout = "vertical",      -- vertical, horizontal
    auto_close = true,
    win = {
      input = {
        height = 1,
        border = "rounded",
        title_pos = "center",
        wo = {
          winblend = 10,
          winhighlight = "Normal:SnacksPickerNormal,FloatBorder:SnacksPickerBorder,FloatTitle:SnacksPickerTitle,CursorLine:SnacksPickerCursorLine",
        },
      },
      list = {
        border = "rounded",
        height = 15,
        wo = {
          winblend = 10,
          winhighlight = "Normal:SnacksPickerList,FloatBorder:SnacksPickerListBorder,CursorLine:SnacksPickerCursorLine",
        },
      },
    },
    
    -- Icons and formatting
    icons = {
      file = " ",
      dir = " ",
      modified = "● ",
      hidden = " ",
    },
    
    -- Display options
    show_count = true,
    show_icons = true,
    show_modified = true,
    
    -- Performance
    debounce = 30,
    
    -- Preview window
    preview = {
      enabled = true,
      border = "rounded",
      wo = {
        winblend = 5,
        winhighlight = "Normal:SnacksPickerPreview,FloatBorder:SnacksPickerPreviewBorder",
      },
    },
    
    -- Matchers & sorters
    matcher = {
      frecency = true,
      current_buf = true,
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- PROGRESS INDICATORS - Loading & progress bars
  -- ═══════════════════════════════════════════════════════════
  progress = {
    enabled = true,
    interval = 50,            -- Refresh rate in ms
    
    -- Spinner animation
    spinner = {
      frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      interval = 80,
    },
    
    -- Window configuration
    win = {
      relative = "editor",
      position = {
        row = -2,
        col = "100%",
      },
      size = {
        width = 40,
        height = 1,
      },
      border = "rounded",
      title_pos = "center",
      wo = {
        winblend = 5,
        winhighlight = "Normal:SnacksProgressNormal,FloatBorder:SnacksProgressBorder,FloatTitle:SnacksProgressTitle",
      },
    },
    
    -- Display format
    format = {
      icon = " ",
      title = "{title}",
      message = "{msg}",
      percentage = "{percentage}%",
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- DASHBOARD - Optional startup screen
  -- ═══════════════════════════════════════════════════════════
  dashboard = {
    enabled = false,
  },

  -- ═══════════════════════════════════════════════════════════
  -- BIG FILE HANDLING - Performance optimization
  -- ═══════════════════════════════════════════════════════════
  bigfile = {
    enabled = true,
    size = 1024 * 1024, -- 1MB
    notify = true,
  },

  -- ═══════════════════════════════════════════════════════════
  -- QUICKFILE - Fast file loading
  -- ═══════════════════════════════════════════════════════════
  quickfile = {
    enabled = true,
  },

  -- ═══════════════════════════════════════════════════════════
  -- STATUSCOLUMN - Enhanced status column
  -- ═══════════════════════════════════════════════════════════
  statuscolumn = {
    enabled = false,
  },
  -- ═══════════════════════════════════════════════════════════
  -- SEARCH - Enhanced search UI
  -- ═══════════════════════════════════════════════════════════
  search = {
    enabled = true,
    -- Show search count in virtual text
    show_count = true,
    -- Position of search count
    position = "top-right",
    -- Highlight style
    hl_search = "IncSearch",
    hl_current = "CurSearch",
  },

 -- ═══════════════════════════════════════════════════════════
  -- ═══════════════════════════════════════════════════════════
  -- SCOPE - Highlight scope
  -- ═══════════════════════════════════════════════════════════
  scope = {
    enabled = true,
    animate = {
      enabled = true,
      duration = 200,
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- STYLES - Global style configuration
  -- ═══════════════════════════════════════════════════════════
  styles = {
    notification = {
      border = "rounded",
      wo = { 
        winblend = 10,
        wrap = true,
      },
    },
    input = {
      border = "rounded",
      wo = { winblend = 10 },
    },
    picker = {
      border = "rounded",
      wo = { winblend = 10 },
    },
  },
})

-- ═══════════════════════════════════════════════════════════
-- CUSTOM HIGHLIGHTS - Theme-aware colors
-- ═══════════════════════════════════════════════════════════
local function setup_highlights()
  local colors = get_colors()
  
  local highlights = {
    -- Notification highlights
    SnacksNotifierInfo = { fg = colors.info, bold = true },
    SnacksNotifierWarn = { fg = colors.warning, bold = true },
    SnacksNotifierError = { fg = colors.error, bold = true },
    SnacksNotifierDebug = { fg = colors.muted, italic = true },
    SnacksNotifierTrace = { fg = colors.purple, italic = true },
    SnacksNotifierIconInfo = { fg = colors.info },
    SnacksNotifierIconWarn = { fg = colors.warning },
    SnacksNotifierIconError = { fg = colors.error },
    SnacksNotifierIconDebug = { fg = colors.muted },
    SnacksNotifierIconTrace = { fg = colors.purple },
    SnacksNotifierTitle = { fg = colors.accent, bold = true },
    SnacksNotifierBorder = { fg = colors.accent, bg = colors.bg },
    SnacksNotifierFooter = { fg = colors.muted, italic = true },
    SnacksNotifierHistory = { bg = colors.bg, fg = colors.fg },
    SnacksNotifierHistoryBorder = { fg = colors.purple, bg = colors.bg, bold = true },
    
    -- Input prompt highlights
    SnacksInputNormal = { bg = colors.bg, fg = colors.fg },
    SnacksInputBorder = { fg = colors.teal, bg = colors.bg, bold = true },
    SnacksInputTitle = { fg = colors.teal, bold = true },
    SnacksInputIcon = { fg = colors.accent, bold = true },
    
    -- Picker highlights
    SnacksPickerNormal = { bg = colors.bg, fg = colors.fg },
    SnacksPickerBorder = { fg = colors.accent, bg = colors.bg, bold = true },
    SnacksPickerTitle = { fg = colors.accent, bold = true },
    SnacksPickerList = { bg = colors.bg, fg = colors.fg },
    SnacksPickerListBorder = { fg = colors.accent, bg = colors.bg },
    SnacksPickerCursorLine = { bg = colors.highlight, bold = true },
    SnacksPickerPreview = { bg = colors.bg, fg = colors.fg },
    SnacksPickerPreviewBorder = { fg = colors.purple, bg = colors.bg },
    SnacksPickerMatch = { fg = colors.warning, bold = true },
    SnacksPickerDir = { fg = colors.accent, bold = true },
    SnacksPickerFile = { fg = colors.fg },
    SnacksPickerModified = { fg = colors.orange },
    SnacksPickerHidden = { fg = colors.muted, italic = true },
    
    -- Progress highlights
    SnacksProgressNormal = { bg = colors.bg, fg = colors.success },
    SnacksProgressBorder = { fg = colors.success, bg = colors.bg },
    SnacksProgressTitle = { fg = colors.success, bold = true },
    SnacksProgressSpinner = { fg = colors.warning, bold = true },
    SnacksProgressBar = { fg = colors.success, bg = colors.highlight },
    
    -- Backdrop
    SnacksBackdrop = { bg = "#000000", blend = 60 },
    
    -- Dashboard (if enabled)
    SnacksDashboardHeader = { fg = colors.accent, bold = true },
    SnacksDashboardFooter = { fg = colors.muted, italic = true },
    SnacksDashboardIcon = { fg = colors.purple },
    SnacksDashboardKey = { fg = colors.warning, bold = true },
    SnacksDashboardDesc = { fg = colors.fg },
    SnacksDashboardFile = { fg = colors.info },
    SnacksDashboardDir = { fg = colors.accent },
    SnacksDashboardSpecial = { fg = colors.teal },
    
    -- Words highlight
    SnacksWords = { bg = colors.highlight, underline = true },
    
    -- Search highlights
    SnacksSearch = { bg = colors.warning, fg = colors.bg, bold = true },
    SnacksSearchCurrent = { bg = colors.error, fg = colors.bg, bold = true },
    SnacksSearchCount = { fg = colors.warning, bold = true },
    IncSearch = { bg = colors.warning, fg = colors.bg, bold = true },
    CurSearch = { bg = colors.error, fg = colors.bg, bold = true },
    Search = { bg = colors.orange, fg = colors.bg },
    
    -- Indent guides
    -- SnacksIndent = { fg = colors.muted },
   -- SnacksIndentScope = { fg = colors.accent, bold = true },
    
    -- Scope highlights
    SnacksScope = { bg = colors.highlight },
    SnacksScopeUnderline = { underline = true, sp = colors.accent },
  }
  
  -- Apply highlights
  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
  
  -- Also set standard Vim search highlights for consistency
  vim.api.nvim_set_hl(0, "Search", { bg = colors.orange, fg = colors.bg })
  vim.api.nvim_set_hl(0, "IncSearch", { bg = colors.warning, fg = colors.bg, bold = true })
  vim.api.nvim_set_hl(0, "CurSearch", { bg = colors.error, fg = colors.bg, bold = true })
  vim.api.nvim_set_hl(0, "Substitute", { bg = colors.error, fg = colors.bg, bold = true })
  
  -- Visual mode selection
 -- vim.api.nvim_set_hl(0, "Visual", { bg = colors.highlight, bold = true })
 -- vim.api.nvim_set_hl(0, "VisualNOS", { bg = colors.highlight })
  
  -- Cursor highlights
 --  vim.api.nvim_set_hl(0, "Cursor", { fg = colors.bg, bg = colors.fg })
 -- vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.highlight })
 -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.accent, bold = true })
 --  vim.api.nvim_set_hl(0, "LineNr", { fg = colors.muted })
  
  -- Match parentheses
  vim.api.nvim_set_hl(0, "MatchParen", { fg = colors.warning, bold = true, underline = true })
  
  -- Fold highlights
  vim.api.nvim_set_hl(0, "Folded", { bg = colors.highlight, fg = colors.muted, italic = true })
  vim.api.nvim_set_hl(0, "FoldColumn", { fg = colors.muted })
  
  -- Sign column
  vim.api.nvim_set_hl(0, "SignColumn", { bg = colors.bg })
  
  -- Pmenu (popup menu) - for completions
  vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.highlight, fg = colors.fg })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.accent, fg = colors.bg, bold = true })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.highlight })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.accent })
  
  -- Command line
  vim.api.nvim_set_hl(0, "MsgArea", { fg = colors.fg })
  vim.api.nvim_set_hl(0, "ModeMsg", { fg = colors.info, bold = true })
  vim.api.nvim_set_hl(0, "MoreMsg", { fg = colors.success, bold = true })
  vim.api.nvim_set_hl(0, "Question", { fg = colors.warning, bold = true })
  vim.api.nvim_set_hl(0, "WarningMsg", { fg = colors.warning, bold = true })
  vim.api.nvim_set_hl(0, "ErrorMsg", { fg = colors.error, bold = true })
  
  -- Diagnostic highlights
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = colors.error })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = colors.warning })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = colors.info })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = colors.teal })
  vim.api.nvim_set_hl(0, "DiagnosticOk", { fg = colors.success })
  
  -- Virtual text
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = colors.error, italic = true })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = colors.warning, italic = true })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = colors.info, italic = true })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = colors.teal, italic = true })
  
  -- Underlines for diagnostics
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warning })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.teal })
  
  -- Spell checking
  vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = colors.error })
  vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = colors.warning })
  vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = colors.info })
  vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = colors.teal })
  
  -- Diff highlights
  vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#2a3a2f", fg = colors.success })
  vim.api.nvim_set_hl(0, "DiffChange", { bg = "#3a3a2f", fg = colors.warning })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3a2a2f", fg = colors.error })
  vim.api.nvim_set_hl(0, "DiffText", { bg = "#4a4a2f", fg = colors.warning, bold = true })
  
  -- Git signs (if using gitsigns.nvim)
  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.success })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.warning })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.error })
  
  -- Telescope (if using telescope.nvim)
  vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = colors.accent, bg = colors.bg })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.teal, bg = colors.bg })
  vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = colors.accent, bg = colors.bg })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = colors.purple, bg = colors.bg })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = colors.highlight, bold = true })
  vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = colors.warning, bold = true })
end

-- Setup highlights on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = setup_highlights,
})

-- Setup highlights immediately
setup_highlights()

-- ═══════════════════════════════════════════════════════════
-- OVERRIDE vim.notify WITH SNACKS NOTIFIER
-- ═══════════════════════════════════════════════════════════
vim.notify = snacks.notifier.notify

-- ═══════════════════════════════════════════════════════════
-- KEYBINDINGS - UI interaction shortcuts
-- ═══════════════════════════════════════════════════════════
local keymap = vim.keymap.set

-- Notification keybindings
keymap("n", "<leader>sn", function()
  snacks.notifier.show_history()
end, { desc = "Snacks: Show notification history", silent = true })

keymap("n", "<leader>sd", function()
  snacks.notifier.hide()
end, { desc = "Snacks: Dismiss notifications", silent = true })

keymap("n", "<leader>sD", function()
  snacks.notifier.hide_history()
end, { desc = "Snacks: Close notification history", silent = true })

-- Buffer picker
keymap("n", "<leader>sb", function()
  snacks.picker.buffers()
end, { desc = "Snacks: Buffer picker", silent = true })

-- File picker (if you want a simple file picker)
keymap("n", "<leader>sf", function()
  snacks.picker.files()
end, { desc = "Snacks: File picker", silent = true })

-- Recent files picker
keymap("n", "<leader>sr", function()
  snacks.picker.recent()
end, { desc = "Snacks: Recent files", silent = true })

-- Grep picker
keymap("n", "<leader>sg", function()
  snacks.picker.grep()
end, { desc = "Snacks: Grep picker", silent = true })

-- Input prompt example (custom usage)
keymap("n", "<leader>si", function()
  snacks.input({
    prompt = "Enter text: ",
    default = "",
  }, function(value)
    if value then
      vim.notify("You entered: " .. value, vim.log.levels.INFO)
    end
  end)
end, { desc = "Snacks: Input prompt", silent = true })

-- Progress example (for testing)
keymap("n", "<leader>sp", function()
  local progress = snacks.progress({
    title = "Loading",
    message = "Processing...",
  })
  
  vim.defer_fn(function()
    progress:update({ percentage = 50, message = "Half way..." })
  end, 1000)
  
  vim.defer_fn(function()
    progress:update({ percentage = 100, message = "Complete!" })
    progress:close()
  end, 2000)
end, { desc = "Snacks: Test progress", silent = true })

-- Word highlighting toggle
keymap("n", "<leader>sw", function()
  snacks.words.toggle()
end, { desc = "Snacks: Toggle word highlighting", silent = true })

-- Search highlighting toggle
keymap("n", "<leader>sh", "<cmd>set hlsearch!<CR>", 
  { desc = "Snacks: Toggle search highlighting", silent = true })

-- Clear search highlight
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", 
  { desc = "Clear search highlighting", silent = true })

-- Big file info
keymap("n", "<leader>sB", function()
  local buf = vim.api.nvim_get_current_buf()
  local size = vim.api.nvim_buf_line_count(buf)
  vim.notify(string.format("Buffer has %d lines", size), vim.log.levels.INFO)
end, { desc = "Snacks: Buffer info", silent = true })

-- ═══════════════════════════════════════════════════════════
-- AUTO-COMMANDS - Enhanced behavior
-- ═══════════════════════════════════════════════════════════

-- Show notification when big file is opened
vim.api.nvim_create_autocmd("User", {
  pattern = "BigFileDetected",
  callback = function()
    vim.notify("Big file detected! Some features disabled for performance.", vim.log.levels.WARN)
  end,
})

-- Welcome notification on startup (optional)
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.defer_fn(function()
      snacks.notifier.notify("Welcome to Neovim! 🚀", vim.log.levels.INFO, {
        title = "Snacks",
        timeout = 2000,
      })
    end, 100)
  end,
})
