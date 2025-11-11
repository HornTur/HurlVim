-- ═══════════════════════════════════════════════════════════
-- NOICE.NVIM - Modern UI Configuration
-- Transparent, theme-adaptive, and performant
-- ═══════════════════════════════════════════════════════════

local status_ok, noice = pcall(require, "noice")
if not status_ok then
  vim.notify("Noice not found!", vim.log.levels.ERROR)
  return
end

-- ═══════════════════════════════════════════════════════════
-- UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════

--- Get color from highlight group with fallback
---@param group string Highlight group name
---@param attr string Color attribute (fg/bg)
---@param fallback? number|string|nil Fallback color in hex or "NONE"
---@return number|string
local function get_hl_color(group, attr, fallback)
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  return hl[attr] or fallback or "NONE"
end

-- ═══════════════════════════════════════════════════════════
-- NOICE SETUP
-- ═══════════════════════════════════════════════════════════

noice.setup({
  -- ═══════════════════════════════════════════════════════════
  -- LSP CONFIGURATION
  -- ═══════════════════════════════════════════════════════════
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
    hover = {
      enabled = true,
      silent = false,
      view = nil, -- Use default view
      opts = {},
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true,
        luasnip = true,
        throttle = 50,
      },
      view = nil, -- Use default view
      opts = {},
    },
    progress = {
      enabled = true,
      format = "lsp_progress",
      format_done = "lsp_progress_done",
      throttle = 1000 / 30, -- 30fps
      view = "mini",
    },
    message = {
      enabled = true,
      view = "notify",
      opts = {},
    },
    documentation = {
      view = "hover",
      opts = {
        lang = "markdown",
        replace = true,
        render = "plain",
        format = { "{message}" },
        win_options = {
          concealcursor = "n",
          conceallevel = 3,
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "FloatBorder",
          },
        },
      },
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- PRESETS
  -- ═══════════════════════════════════════════════════════════
  presets = {
    bottom_search = false,         -- Classic bottom cmdline
    command_palette = true,        -- Centered command palette
    long_message_to_split = true,  -- Long messages in split
    inc_rename = false,            -- Show inc-rename in cmdline
    lsp_doc_border = true,         -- Add border to LSP docs
  },

  -- ═══════════════════════════════════════════════════════════
  -- COMMAND LINE
  -- ═══════════════════════════════════════════════════════════
cmdline = {
  enabled = true,
  view = "cmdline_popup",
  opts = {},
  format = {
    cmdline = {
      pattern = "^:",
      icon = "󰘳 ",  -- Vim command icon, strong and sleek
      lang = "vim",
      title = " Command",
    },
    search_down = {
      kind = "search",
      pattern = "^/",
      icon = "󱎸 ",  -- Downward search, large magnifier
      lang = "regex",
      title = " Search",
    },
    search_up = {
      kind = "search",
      pattern = "^%?",
      icon = " ",  -- Upward search, inverse magnifier
      lang = "regex",
      title = " Search",
    },
    filter = {
      pattern = "^:%s*!",
      icon = " ",  -- Filter/funnel, perfect for shell commands
      lang = "bash",
      title = " Shell",
    },
    lua = {
      pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
      icon = " ",  -- Lua swirl, big and rounded
      lang = "lua",
      title = " Lua",
    },
    help = {
      pattern = "^:%s*he?l?p?%s+",
      icon = "󰞋 ",  -- Book/help icon
      title = " Help",
    },
    input = {
      view = "cmdline_input",
      icon = "󰡁 ",  -- Input terminal bubble
    },
  },
},
  -- ═══════════════════════════════════════════════════════════
  -- MESSAGES
  -- ═══════════════════════════════════════════════════════════
  messages = {
    enabled = true,
    view = "notify",
    view_error = "notify",
    view_warn = "notify",
    view_history = "messages",
    view_search = "virtualtext",
  },

  -- ═══════════════════════════════════════════════════════════
  -- POPUP MENU
  -- ═══════════════════════════════════════════════════════════
  popupmenu = {
    enabled = true,
    backend = "nui",
    kind_icons = {},
  },

  -- ═══════════════════════════════════════════════════════════
  -- NOTIFICATION
  -- ═══════════════════════════════════════════════════════════
  notify = {
    enabled = true,
    view = "notify",
  },

  -- ═══════════════════════════════════════════════════════════
  -- ROUTES - Smart message filtering
  -- ═══════════════════════════════════════════════════════════
  routes = {
    -- Long messages to split
    {
      filter = {
        event = "msg_show",
        min_height = 20,
      },
      view = "split",
    },
    -- Skip search count messages
    {
      filter = {
        event = "msg_show",
        kind = "search_count",
      },
      opts = { skip = true },
    },
    -- Skip written messages
    {
      filter = {
        event = "msg_show",
        find = "written",
      },
      opts = { skip = true },
    },
    -- Skip save messages
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "lines? --",
      },
      opts = { skip = true },
    },
    -- Skip yanked messages  
    {
      filter = {
        event = "msg_show",
        find = "yanked",
      },
      opts = { skip = true },
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- VIEWS - Modern, transparent UI elements
  -- ═══════════════════════════════════════════════════════════
  views = {
    cmdline_popup = {
      position = {
        row = "40%",
        col = "50%",
      },
      size = {
        min_width = 60,
        width = "auto",
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = {
          Normal = "NoiceCmdlinePopup",
          FloatBorder = "NoiceCmdlinePopupBorder",
          FloatTitle = "NoiceCmdlinePopupTitle",
        },
        winblend = 0,
      },
    },
    cmdline_input = {
      position = {
        row = "40%",
        col = "50%",
      },
      size = {
        min_width = 60,
        width = "auto",
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = {
          Normal = "NoiceCmdlinePopup",
          FloatBorder = "NoiceCmdlinePopupBorder",
        },
        winblend = 0,
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = "50%",
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = {
          Normal = "NoicePopupmenu",
          FloatBorder = "NoicePopupmenuBorder",
          CursorLine = "NoicePopupmenuSelected",
        },
        winblend = 0,
      },
    },
    confirm = {
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      position = {
        row = "40%",
        col = "50%",
      },
      size = "auto",
      win_options = {
        winhighlight = {
          Normal = "NoiceConfirm",
          FloatBorder = "NoiceConfirmBorder",
        },
        winblend = 0,
      },
    },
    hover = {
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      position = { row = 2, col = 2 },
      size = {
        max_width = 80,
        max_height = 20,
      },
      win_options = {
        winhighlight = {
          Normal = "NormalFloat",
          FloatBorder = "FloatBorder",
        },
        winblend = 0,
      },
      scrollbar = true,
    },
    split = {
      enter = true,
      relative = "editor",
      position = "bottom",
      size = "30%",
      win_options = {
        winhighlight = {
          Normal = "NoiceSplit",
        },
      },
    },
    mini = {
      timeout = 2000,
      reverse = true,
      position = {
        row = -2,
        col = "100%",
      },
      size = "auto",
      border = {
        style = "none",
      },
      win_options = {
        winblend = 0,
        winhighlight = {
          Normal = "NoiceMini",
        },
      },
    },
  },

  -- ═══════════════════════════════════════════════════════════
  -- HEALTH CHECK
  -- ═══════════════════════════════════════════════════════════
  health = {
    checker = true,
  },

  -- ═══════════════════════════════════════════════════════════
  -- PERFORMANCE
  -- ═══════════════════════════════════════════════════════════
  throttle = 1000 / 30, -- 30fps for smooth animations
})

-- ═══════════════════════════════════════════════════════════
-- THEME-ADAPTIVE HIGHLIGHTS
-- Automatically adapts to any colorscheme
-- ═══════════════════════════════════════════════════════════

local function setup_highlights()
  -- Get base colors from current theme
  local normal_bg = get_hl_color("Normal", "bg")
  local normal_fg = get_hl_color("Normal", "fg")
  local float_bg = get_hl_color("NormalFloat", "bg", normal_bg)
  local float_border = get_hl_color("FloatBorder", "fg")

  -- Get accent colors from common highlight groups
  local cursor_line = get_hl_color("CursorLine", "bg")
  local pmenu_sel = get_hl_color("PmenuSel", "bg", cursor_line)

  -- Get semantic colors
  local info_fg = get_hl_color("DiagnosticInfo", "fg", float_border)
  local hint_fg = get_hl_color("DiagnosticHint", "fg", float_border)
  local warn_fg = get_hl_color("DiagnosticWarn", "fg")
  local ok_fg = get_hl_color("DiagnosticOk", "fg", info_fg)

  -- Special handling for keyword/statement colors (for icons)
  local keyword_fg = get_hl_color("Keyword", "fg", info_fg)
  local func_fg = get_hl_color("Function", "fg", info_fg)

  local highlights = {
    -- Command line popup
    NoiceCmdlinePopup = { bg = float_bg, fg = normal_fg },
    NoiceCmdlinePopupBorder = { bg = float_bg, fg = float_border },
    NoiceCmdlinePopupTitle = { bg = float_bg, fg = keyword_fg, bold = true },
    NoiceCmdlineIcon = { fg = info_fg },
    NoiceCmdlineIconSearch = { fg = warn_fg },
    
    -- Popup menu (completion)
    NoicePopupmenu = { link = "NormalFloat" },
    NoicePopupmenuBorder = { link = "FloatBorder" },
    NoicePopupmenuSelected = { bg = pmenu_sel, bold = true },
    NoicePopupmenuMatch = { fg = keyword_fg, bold = true },
    
    -- Confirmation dialogs
    NoiceConfirm = { link = "NormalFloat" },
    NoiceConfirmBorder = { bg = float_bg, fg = warn_fg },
    
    -- Split view
    NoiceSplit = { link = "Normal" },
    NoiceSplitBorder = { link = "FloatBorder" },
    
    -- Mini view (bottom right notifications)
    NoiceMini = { bg = float_bg, fg = ok_fg },
    
    -- Format elements
    NoiceFormatTitle = { fg = keyword_fg, bold = true },
    NoiceFormatProgressTodo = { link = "Comment" },
    NoiceFormatProgressDone = { fg = ok_fg, bold = true },
    
    -- LSP specific
    NoiceLspProgressTitle = { fg = func_fg },
    NoiceLspProgressClient = { fg = hint_fg },
    NoiceLspProgressSpinner = { fg = info_fg },
    
    -- Virtual text
    NoiceVirtualText = { link = "DiagnosticVirtualTextInfo" },
    
    -- Cursor elements
    NoiceCursor = { link = "Cursor" },
  }

  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

-- Setup highlights on startup and colorscheme change
local augroup = vim.api.nvim_create_augroup("NoiceHighlights", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup,
  callback = function()
    -- Small delay to ensure colorscheme is fully loaded
    vim.defer_fn(setup_highlights, 50)
  end,
  desc = "Update Noice highlights on colorscheme change",
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup,
  callback = function()
    vim.defer_fn(setup_highlights, 100)
  end,
  desc = "Setup Noice highlights on startup",
  once = true,
})

-- ═══════════════════════════════════════════════════════════
-- KEYBINDINGS
-- ═══════════════════════════════════════════════════════════

local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "<leader>nh", "<cmd>Noice history<CR>",
  vim.tbl_extend("force", opts, { desc = "Noice: Message history" }))
keymap("n", "<leader>nl", "<cmd>Noice last<CR>",
  vim.tbl_extend("force", opts, { desc = "Noice: Last message" }))
keymap("n", "<leader>nd", "<cmd>Noice dismiss<CR>",
  vim.tbl_extend("force", opts, { desc = "Noice: Dismiss all" }))
keymap("n", "<leader>ne", "<cmd>Noice errors<CR>",
  vim.tbl_extend("force", opts, { desc = "Noice: Show errors" }))
keymap("n", "<leader>nt", "<cmd>Noice telescope<CR>",
  vim.tbl_extend("force", opts, { desc = "Noice: Open in Telescope" }))

-- Scroll in hover/signature windows
keymap({ "n", "i", "s" }, "<C-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<C-f>"
  end
end, { silent = true, expr = true, desc = "Scroll forward in LSP window" })

keymap({ "n", "i", "s" }, "<C-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<C-b>"
  end
end, { silent = true, expr = true, desc = "Scroll backward in LSP window" })

-- ═══════════════════════════════════════════════════════════
-- NVIM-NOTIFY INTEGRATION
-- Modern, adaptive notification system
-- ═══════════════════════════════════════════════════════════

local notify_ok, notify = pcall(require, "notify")
if notify_ok then
  notify.setup({
    background_colour = function()
      -- Use NormalFloat background or fall back to transparent
      local bg = get_hl_color("NormalFloat", "bg")
      if bg == "NONE" or type(bg) ~= "number" then
        return "#000000"
      end
      return string.format("#%06x", bg)
    end,
    fps = 60,
    icons = {
      DEBUG = " ",   -- Debug glyph, square and strong
      ERROR = "✘ ",   -- Big cross, clean and readable
      INFO  = " ",   -- Bold info circle
      TRACE = "󰙨 ",   -- Swirling trace symbol, detailed
      WARN  = " ",   -- Classic warning triangle
    },

    level = vim.log.levels.INFO,
    minimum_width = 50,
    max_width = 80,
    max_height = 20,
    render = "wrapped-compact",
    stages = "fade_in_slide_out",
    timeout = 2500,
    top_down = false,
    on_open = function(win)
      -- Make notifications respect theme
      vim.api.nvim_win_set_config(win, {
        border = "rounded",
        focusable = false
      })
    end,
  })
  
  -- Set as default notify handler
  vim.notify = notify
end
