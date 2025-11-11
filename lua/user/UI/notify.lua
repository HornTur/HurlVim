-- =====================
-- Enhanced Gruvbox Notify Setup
-- =====================
local notify = require("notify")

-- Helper: adaptive timeout (based on message length)
local function adaptive_timeout(msg)
  local base = 2000 -- minimum 2s
  local extra = #msg * 40 -- add 40ms per character
  local max = 6000 -- cap at 6s
  return math.min(base + extra, max)
end

notify.setup({
  -- Default fallback timeout
  timeout = 4000,

  -- Smooth Gruvbox animation
  stages = "static",

  -- Gruvbox dark hard background
  background_colour = "#1d2021",

  -- Logging level
  level = vim.log.levels.INFO,

  -- Responsive sizing
  max_width = math.floor(vim.o.columns * 0.75),
  max_height = math.floor(vim.o.lines * 0.6),

  -- Rendering style
  render = "simple",
})

-- Override vim.notify
vim.notify = function(msg, level, opts)
  opts = opts or {}

  -- Adaptive timing
  if not opts.timeout and level ~= vim.log.levels.ERROR then
    opts.timeout = adaptive_timeout(tostring(msg))
  end

  -- Errors stay until dismissed
  if level == vim.log.levels.ERROR then
    opts.timeout = false
  end

  notify(msg, level, opts)
end

-- =====================
-- Gruvbox Notify Highlights
-- =====================
-- ERROR (red)
vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#cc241d", bg = "#1d2021" })
vim.api.nvim_set_hl(0, "NotifyERRORIcon",   { fg = "#fb4934" })
vim.api.nvim_set_hl(0, "NotifyERRORTitle",  { fg = "#fb4934", bold = true })
vim.api.nvim_set_hl(0, "NotifyERRORBody",   { fg = "#ebdbb2", bg = "#1d2021" })

-- WARN (yellow)
vim.api.nvim_set_hl(0, "NotifyWARNBorder",  { fg = "#d79921", bg = "#1d2021" })
vim.api.nvim_set_hl(0, "NotifyWARNIcon",    { fg = "#fabd2f" })
vim.api.nvim_set_hl(0, "NotifyWARNTitle",   { fg = "#fabd2f", bold = true })
vim.api.nvim_set_hl(0, "NotifyWARNBody",    { fg = "#ebdbb2", bg = "#1d2021" })

-- INFO (aqua/blue mix)
vim.api.nvim_set_hl(0, "NotifyINFOBorder",  { fg = "#458588", bg = "#1d2021" })
vim.api.nvim_set_hl(0, "NotifyINFOIcon",    { fg = "#83a598" })
vim.api.nvim_set_hl(0, "NotifyINFOTitle",   { fg = "#83a598", bold = true })
vim.api.nvim_set_hl(0, "NotifyINFOBody",    { fg = "#ebdbb2", bg = "#1d2021" })

-- DEBUG (gray/neutral)
vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#928374", bg = "#1d2021" })
vim.api.nvim_set_hl(0, "NotifyDEBUGIcon",   { fg = "#928374" })
vim.api.nvim_set_hl(0, "NotifyDEBUGTitle",  { fg = "#928374", bold = true })
vim.api.nvim_set_hl(0, "NotifyDEBUGBody",   { fg = "#ebdbb2", bg = "#1d2021" })

-- TRACE (purple)
vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#b16286", bg = "#1d2021" })
vim.api.nvim_set_hl(0, "NotifyTRACEIcon",   { fg = "#d3869b" })
vim.api.nvim_set_hl(0, "NotifyTRACETitle",  { fg = "#d3869b", bold = true })
vim.api.nvim_set_hl(0, "NotifyTRACEBody",   { fg = "#ebdbb2", bg = "#1d2021" })
