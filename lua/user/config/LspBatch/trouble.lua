-- ============================================
-- Trouble.nvim Configuration (v3+)
-- Modern setup with Nerd Font glyphs
-- ============================================

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  opts = {
    -- Modern configuration for Trouble v3+
    auto_close = false,           -- Auto close when there are no items
    auto_open = false,            -- Auto open when there are items
    auto_preview = true,          -- Automatically preview the location
    auto_refresh = true,          -- Auto refresh when open
    auto_jump = false,            -- Auto jump to the item when there's only one
    focus = false,                -- Focus the window when opened
    restore = true,               -- Restore last window configuration
    follow = true,                -- Follow the current item
    indent_guides = true,         -- Show indent guides
    max_items = 200,              -- Maximum number of items to process
    multiline = true,             -- Render multi-line messages
    pinned = false,               -- Pin the window
    
    -- Window configuration
    win = {
      type = "split",             -- split or float
      relative = "win",           -- win, editor, or cursor
      position = "bottom",        -- bottom, top, left, right
      size = 0.3,                 -- Height/width as percentage
      wrap = true,
      -- Float specific options
      -- border = "rounded",
      -- title = "Diagnostics",
      -- title_pos = "center",
      -- zindex = 200,
    },
    
    -- Preview window configuration
    preview = {
      type = "main",              -- main, float, split
      scratch = true,
      -- Float options
      -- border = "rounded",
      -- title = "Preview",
      -- title_pos = "center",
    },
    
    -- Throttle refresh
    throttle = {
      refresh = 20,               -- Fetches new data when needed
      update = 10,                -- Updates existing items
      render = 10,                -- Renders the view
      follow = 100,               -- Follows the current item
      preview = { ms = 100, debounce = true }, -- Shows the preview
    },
    
    -- Custom icons with Nerd Fonts
    icons = {
      indent = {
        top           = "│ ",
        middle        = "├╴",
        last          = "└╴",
        fold_open     = " ",
        fold_closed   = " ",
        ws            = "  ",
      },
      folder_closed   = " ",
      folder_open     = " ",
      kinds = {
        Array         = " ",
        Boolean       = "󰨙 ",
        Class         = " ",
        Constant      = "󰏿 ",
        Constructor   = " ",
        Enum          = " ",
        EnumMember    = " ",
        Event         = " ",
        Field         = " ",
        File          = " ",
        Function      = "󰊕 ",
        Interface     = " ",
        Key           = " ",
        Method        = "󰊕 ",
        Module        = " ",
        Namespace     = "󰦮 ",
        Null          = " ",
        Number        = "󰎠 ",
        Object        = " ",
        Operator      = " ",
        Package       = " ",
        Property      = " ",
        String        = " ",
        Struct        = "󰆼 ",
        TypeParameter = " ",
        Variable      = "󰀫 ",
      },
    },
    
    -- Mode-specific settings
    modes = {
      -- LSP diagnostics
      diagnostics = {
        mode = "diagnostics",
        preview = {
          type = "split",
          relative = "win",
          position = "right",
          size = 0.3,
        },
        -- Custom icons for severity
        groups = {
          { "filename", format = "{file_icon} {basename:Title} {count}" },
        },
        format = "{severity_icon} {message:md}",
        filter = {
          any = {
            severity = vim.diagnostic.severity.ERROR,
            severity = vim.diagnostic.severity.WARN,
            severity = vim.diagnostic.severity.INFO,
            severity = vim.diagnostic.severity.HINT,
          },
        },
      },
      
      -- LSP symbols
      symbols = {
        mode = "lsp_document_symbols",
        focus = false,
        win = { position = "right", size = 0.3 },
        filter = {
          -- Remove some less useful symbols
          ["not"] = { kind = "Package" },
          any = {
            kind = {
              "Class",
              "Constructor",
              "Enum",
              "Function",
              "Interface",
              "Method",
              "Module",
              "Namespace",
              "Struct",
            },
          },
        },
      },
      
      -- LSP references
      lsp_references = {
        mode = "lsp_references",
        params = {
          include_declaration = true,
        },
      },
      
      -- Quickfix list
      quickfix = {
        mode = "quickfix",
      },
      
      -- Location list
      loclist = {
        mode = "loclist",
      },
      
      -- Telescope integration
      telescope = {
        mode = "telescope",
      },
    },
    
    -- Custom signs for diagnostics 
    signs = {
      error = " ",
      warning = " ",
      hint = "  ",
      information = " ",
      other = " ",
    },
    
    -- Keymaps inside Trouble window
    keys = {
      ["?"] = "help",
      r = "refresh",
      R = "toggle_refresh",
      q = "close",
      o = "jump_close",
      ["<esc>"] = "cancel",
      ["<cr>"] = "jump",
      ["<2-leftmouse>"] = "jump",
      ["<c-s>"] = "jump_split",
      ["<c-v>"] = "jump_vsplit",
      -- TOC only
      ["<c-q>"] = "jump_close",
      ["<tab>"] = "fold_toggle",
      ["<c-h>"] = "fold_close",
      ["<c-l>"] = "fold_open",
      dd = "delete",
      d = { action = "delete", mode = "v" },
      i = "inspect",
      p = "preview",
      P = "toggle_preview",
      zo = "fold_open",
      zO = "fold_open_recursive",
      zc = "fold_close",
      zC = "fold_close_recursive",
      za = "fold_toggle",
      zA = "fold_toggle_recursive",
      zm = "fold_more",
      zM = "fold_close_all",
      zr = "fold_reduce",
      zR = "fold_open_all",
      zx = "fold_update",
      zX = "fold_update_all",
      zn = "fold_disable",
      zN = "fold_enable",
      zi = "fold_toggle_enable",
      gb = { -- example of a custom action that toggles the active view filter
        action = function(view)
          view:filter({ buf = 0 }, { toggle = true })
        end,
        desc = "Toggle Current Buffer Filter",
      },
      s = { -- example of a custom action that toggles the severity
        action = function(view)
          local f = view:get_filter("severity")
          local severity = ((f and f.filter.severity or 0) + 1) % 5
          view:filter({ severity = severity }, {
            id = "severity",
            template = "{hl:Title}Filter:{hl} {severity}",
            del = severity == 0,
          })
        end,
        desc = "Toggle Severity Filter",
      },
    },
  },
  
  -- Keymaps for opening Trouble
  keys = {
    {
      "<leader>dr",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>xl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").prev({ skip_groups = true, jump = true })
      else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous Trouble/Quickfix Item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next Trouble/Quickfix Item",
    },
  },
}

-- ============================================
-- Alternative: Setup function style
-- ============================================
--[[
require("trouble").setup({
  -- Same opts as above
})

-- Then manually set keymaps:
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" })
-- ... etc
--]]
