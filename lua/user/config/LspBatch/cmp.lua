-- ✨ Elegant & Minimal CMP Configuration
-- FIXED: 4 items in editor, 5 in cmdline, proper navigation

local cmp = require('cmp')
local luasnip = require('luasnip')

-- 🎯 Kind Icons (pretty but not overwhelming)
local kind_icons = {
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
}

-- 📝 Short, human-readable labels
local kind_labels = {
  Text = "Text",
  Method = "Meth",
  Function = "Func",
  Constructor = "Ctor",
  Field = "Field",
  Variable = "Var",
  Class = "Class",
  Interface = "Intf",
  Module = "Mod",
  Property = "Prop",
  Unit = "Unit",
  Value = "Val",
  Enum = "Enum",
  Keyword = "Key",
  Snippet = "Snip",
  Color = "Color",
  File = "File",
  Reference = "Ref",
  Folder = "Dir",
  EnumMember = "EMem",
  Constant = "Const",
  Struct = "Struct",
  Event = "Event",
  Operator = "Op",
  TypeParameter = "Type",
}

cmp.setup({
  -- ❌ NO GHOST TEXT (banned forever!)
  experimental = {
    ghost_text = false,
  },

  -- 🎨 Completion Window Styling - 4 ITEMS FOR TEXT EDITOR
  window = {
    completion = {
      border = "rounded",
      winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
      scrollbar = true,
      col_offset = -3,
      side_padding = 1,
    },
    documentation = cmp.config.disable,
  },

  -- 📋 Formatting (Icons + Short Labels + Abbreviations)
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], kind_labels[vim_item.kind])
      
      if #vim_item.abbr > 30 then
        vim_item.abbr = vim_item.abbr:sub(1, 27) .. "..."
      end
      
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snip]",
        buffer = "[Buf]",
        path = "[Path]",
        nvim_lua = "[Lua]",
      })[entry.source.name]
      
      return vim_item
    end,
  },

  -- ⌨️ Snippet Engine
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- 🎯 Completion Sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp', priority = 1000 },
    { name = 'luasnip', priority = 750 },
    { name = 'buffer', priority = 500, keyword_length = 3 },
    { name = 'path', priority = 250 },
  }),

  -- ⌨️ Keymaps for INSERT MODE (arrow keys + enter to select)
  mapping = cmp.mapping.preset.insert({
    -- Arrow keys for navigation
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    
    -- Scroll through many items
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    
    -- ENTER or TAB to select and insert
    ['<CR>'] = cmp.mapping.confirm({ 
      behavior = cmp.ConfirmBehavior.Replace,
      select = false
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ 
          behavior = cmp.ConfirmBehavior.Replace,
          select = false
        })
      else
        fallback()
      end
    end, { 'i', 's' }),
    
    -- ESC or Ctrl+e to close
    ['<Esc>'] = cmp.mapping.abort(),
    ['<C-e>'] = cmp.mapping.abort(),
    
    -- Ctrl+Space to manually trigger
    ['<C-Space>'] = cmp.mapping.complete(),
  }),

  -- ⚡ Performance
  performance = {
    debounce = 60,
    throttle = 30,
    fetching_timeout = 500,
  },

  -- 🎯 Completion Behavior
  completion = {
    completeopt = 'menu,menuone,noselect',
    keyword_length = 1,
  },

  -- 🔍 Matching
  matching = {
    disallow_fuzzy_matching = false,
    disallow_partial_matching = false,
    disallow_prefix_unmatching = false,
  },
})

-- 📝 COMMAND-LINE COMPLETION - 5 ITEMS with LEFT/RIGHT arrow movement
cmp.setup.cmdline(':', {
  mapping = {
    -- LEFT/RIGHT arrow keys to navigate
    ['<Left>'] = { c = cmp.mapping.select_prev_item() },
    ['<Right>'] = { c = cmp.mapping.select_next_item() },
    ['<Up>'] = { c = cmp.mapping.select_prev_item() },
    ['<Down>'] = { c = cmp.mapping.select_next_item() },
    ['<C-p>'] = { c = cmp.mapping.select_prev_item() },
    ['<C-n>'] = { c = cmp.mapping.select_next_item() },
    
    -- TAB to select and insert to cmdline
    ['<Tab>'] = {
      c = function()
        if cmp.visible() then
          cmp.confirm({ select = false })
        else
          cmp.complete()
        end
      end,
    },
    ['<S-Tab>'] = {
      c = function()
        if cmp.visible() then
          cmp.select_prev_item()
        else
          cmp.complete()
        end
      end,
    },
    
    -- ENTER to select and execute
    ['<CR>'] = { c = cmp.mapping.confirm({ select = false }) },
    
    -- ESC to close
    ['<C-e>'] = { c = cmp.mapping.abort() },
  },
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  }),
  window = {
    completion = {
      border = "rounded",
      scrollbar = true,
    },
  },
})

-- 📝 SEARCH COMPLETION - 5 ITEMS
cmp.setup.cmdline({ '/', '?' }, {
  mapping = {
    ['<Left>'] = { c = cmp.mapping.select_prev_item() },
    ['<Right>'] = { c = cmp.mapping.select_next_item() },
    ['<Up>'] = { c = cmp.mapping.select_prev_item() },
    ['<Down>'] = { c = cmp.mapping.select_next_item() },
    ['<Tab>'] = {
      c = function()
        if cmp.visible() then
          cmp.confirm({ select = false })
        else
          cmp.complete()
        end
      end,
    },
    ['<CR>'] = { c = cmp.mapping.confirm({ select = false}) },
  },
  sources = {
    { name = 'buffer' }
  },
  window = {
    completion = {
      border = "rounded",
      scrollbar = true,
    },
  },
})

-- 🎨 Theme-Adaptive Highlights
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
    local normal_fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg
    
    vim.api.nvim_set_hl(0, "Pmenu", { bg = normal_bg, fg = normal_fg })
    vim.api.nvim_set_hl(0, "PmenuBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "PmenuSel", { link = "CursorLine" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { link = "PmenuSbar" })
    
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { link = "Search" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "Search" })
    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { link = "Function" })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "Function" })
    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { link = "Variable" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { link = "Keyword" })
    vim.api.nvim_set_hl(0, "CmpItemKindClass", { link = "Type" })
    vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "Type" })
    vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "String" })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { link = "Special" })
  end,
})

vim.cmd("doautocmd ColorScheme")

-- 🔥 FORCE 4 ITEMS IN EDITOR, 5 IN CMDLINE
vim.opt.pumheight = 4  -- Default for insert mode (text editor)

-- Override for cmdline mode
vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
    vim.opt.pumheight = 5  -- 5 items in command mode
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    vim.opt.pumheight = 4  -- Back to 4 items in editor
  end,
})

print("✨ CMP configured: 4 items (editor), 5 items (cmdline), proper navigation!")
