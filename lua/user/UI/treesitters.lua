-- Optimized Treesitter Configuration
-- Focus: Pure syntax highlighting and parsing, no formatting/indenting/underlining
-- Place in ~/.config/nvim/lua/config/treesitter.lua

require('nvim-treesitter.configs').setup({
  -- Install essential parsers
--  ensure_installed = {
--    "lua", "python", "vim", "vimdoc", "query",
--    "c", "cpp", "rust", "go", "javascript", "typescript",
--    "html", "css", "json", "yaml", "toml", "markdown"
--  },

    ensure_installed = {},

  -- Install parsers synchronously
  sync_install = false,

  -- Auto-install missing parsers
  auto_install = false,

  -- Required fields
  modules = {},
  ignore_install = { "csv" },

  -- PURE HIGHLIGHTING ONLY
  highlight = {
    enable = true,
    
    -- Disable vim regex highlighting (let treesitter handle it)
    additional_vim_regex_highlighting = false,

    -- Disable for large files (performance)
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },

  -- DISABLE INDENT (we don't want treesitter indenting)
  indent = {
    enable = false,
  },

  -- DISABLE INCREMENTAL SELECTION
  incremental_selection = {
    enable = false,
  },

  -- DISABLE TEXT OBJECTS
  textobjects = {
    enable = false,
  },
})

-- Remove ALL underlines from Treesitter highlights
local function remove_all_underlines()
  local highlights = vim.api.nvim_get_hl(0, {})
  
  for group_name, _ in pairs(highlights) do
    -- Process Treesitter groups (@ prefix) and LSP semantic tokens
    if group_name:match("^@") or group_name:match("^TS") or group_name:match("^@lsp") then
      local hl = vim.api.nvim_get_hl(0, { name = group_name })
      
      -- Remove any underline styling
      if hl.underline or hl.undercurl or hl.underdouble or hl.underdotted or hl.underdashed then
        hl.underline = nil
        hl.undercurl = nil
        hl.underdouble = nil
        hl.underdotted = nil
        hl.underdashed = nil
        
        vim.api.nvim_set_hl(0, group_name, hl)
      end
    end
  end
end

-- Prevent IBL from being affected by Treesitter
local function isolate_ibl_from_treesitter()
  -- Make IBL completely independent
  local ibl_groups = {
    'IblIndent',
    'IblScope',
    'IblWhitespace',
    '@ibl.indent.char',
    '@ibl.scope.char',
  }
  
  for _, group in ipairs(ibl_groups) do
    -- Set with nocombine to prevent treesitter interference
    vim.api.nvim_set_hl(0, group, { 
      fg = '#3c3836', 
      nocombine = true,
      default = false -- Override any defaults
    })
  end
end

-- Apply fixes on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.defer_fn(function()
      remove_all_underlines()
      isolate_ibl_from_treesitter()
    end, 100)
  end,
})

-- Apply immediately
vim.defer_fn(function()
  remove_all_underlines()
  isolate_ibl_from_treesitter()
end, 100)

-- Disable LSP semantic token underlines
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.semanticTokensProvider then
      -- Remove underlines from semantic tokens
      local semantic_groups = {
        '@lsp.type.function',
        '@lsp.type.method',
        '@lsp.type.keyword',
        '@lsp.type.parameter',
        '@lsp.type.variable',
        '@lsp.type.property',
        '@lsp.type.class',
        '@lsp.type.interface',
        '@lsp.type.enum',
        '@lsp.type.decorator',
      }
      
      for _, group in ipairs(semantic_groups) do
        local hl = vim.api.nvim_get_hl(0, { name = group })
        if hl and (hl.underline or hl.undercurl) then
          hl.underline = nil
          hl.undercurl = nil
          vim.api.nvim_set_hl(0, group, hl)
        end
      end
    end
  end,
})

-- DISABLE auto-format and auto-indent globally
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    -- Disable format on save
    vim.b.autoformat = false
    
    -- Use simple indent rules (not treesitter)
    vim.bo.indentexpr = ""
  end,
})

-- Optional: Enhance Treesitter colors for better visibility
-- Uncomment if you want more vibrant colors
--[[
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- Boost treesitter highlight intensity
    vim.api.nvim_set_hl(0, '@function', { fg = '#8ec07c', bold = true })
    vim.api.nvim_set_hl(0, '@keyword', { fg = '#fb4934', bold = true })
    vim.api.nvim_set_hl(0, '@string', { fg = '#b8bb26' })
    vim.api.nvim_set_hl(0, '@variable', { fg = '#ebdbb2' })
    vim.api.nvim_set_hl(0, '@type', { fg = '#fabd2f' })
    vim.api.nvim_set_hl(0, '@constant', { fg = '#d3869b' })
  end,
})
--]]
