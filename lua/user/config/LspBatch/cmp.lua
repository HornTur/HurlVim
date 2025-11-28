local cmp = require('cmp')
local luasnip = require('luasnip')

-- State for toggling documentation
local docs_enabled = false

-- Function to toggle documentation
local function toggle_docs()
    docs_enabled = not docs_enabled
    if docs_enabled then
        vim.notify("nvim-cmp: Documentation enabled", vim.log.levels.INFO)
    else
        vim.notify("nvim-cmp: Documentation disabled", vim.log.levels.INFO)
        -- Close any open documentation windows
        cmp.close()
    end
end

-- Set up the keymap for toggling docs
vim.keymap.set('n', '<leader>utc', toggle_docs, { desc = 'Toggle completion docs' })

cmp.setup({
    -- No preselection
    preselect = cmp.PreselectMode.None,

    completion = {
        -- Trigger on every character change in insert mode
        autocomplete = {
            cmp.TriggerEvent.TextChanged,
            cmp.TriggerEvent.InsertEnter,
        },
        -- Minimum 2 characters (blink-cmp default)
        keyword_length = 2,
        completeopt = 'menu,menuone,noinsert,noselect',
    },

    -- Snippet expansion
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    -- Window styling
    window = {
        completion = {
            border = 'rounded',
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
            col_offset = -3,
            side_padding = 1,
            scrollbar = true, -- Enable scrollbar
            max_height = 5, -- Show 5 items at once
        },
        documentation = {
            border = 'rounded',
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu',
            max_height = 15,
            max_width = 80,
        },
    },

    -- Formatting: LSP first, show kind icons and source
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
            -- Beautiful Nerd Font icons for each completion kind
            local kind_icons = {
                Text = '󰉿',
                Method = '󰆧',
                Function = '󰊕',
                Constructor = '',
                Field = '󰜢',
                Variable = '󰀫',
                Class = '󰠱',
                Interface = '',
                Module = '',
                Property = '󰜢',
                Unit = '󰑭',
                Value = '󰎠',
                Enum = '',
                Keyword = '󰌋',
                Snippet = '',
                Color = '󰏌',
                File = '󰈙',
                Reference = '󰈇',
                Folder = '󰉋',
                EnumMember = '',
                Constant = '󰏿',
                Struct = '󰙅',
                Event = '',
                Operator = '󰆕',
                TypeParameter = '',
            }

            -- Add beautiful icon before the item
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind] or '', vim_item.kind)

            -- Show source name with icons
            local source_icons = {
                nvim_lsp = '  ',
                luasnip = '  ',
                buffer = '  ',
                path = '  ',
                cmdline = '  ',
            }

            vim_item.menu = source_icons[entry.source.name] or ''

            return vim_item
        end,
    },

    -- View settings
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' },
        docs = {
            auto_open = false, -- Docs disabled by default
        },
    },

    -- Ghost text
    experimental = {
        ghost_text = {
            hl_group = 'Comment',
        },
    },

    -- Performance optimization
    performance = {
        debounce = 50,      -- Fast debounce (50ms)
        throttle = 30,      -- Fast throttle (30ms)
        fetching_timeout = 200, -- Quick timeout
        max_view_entries = 200, -- Allow more items for scrolling
    },

    -- Sources: LSP prioritized
    sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1000, max_item_count = 200 },
        { name = 'luasnip',  priority = 750,  max_item_count = 200 },
    }, {
        { name = 'buffer', priority = 500, max_item_count = 200 },
        { name = 'path',   priority = 250, max_item_count = 200 },
    }),

    -- Sorting
    sorting = {
        priority_weight = 2,
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },

    -- Keymaps
    mapping = cmp.mapping.preset.insert({
        -- Navigate with Up/Down
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

        -- Navigate with Tab/Shift-Tab
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        -- Confirm with Enter
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false, -- Only confirm explicitly selected items
        }),

        -- Scroll docs (if manually opened)
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),

        -- Scroll through completion items
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),

        -- Abort completion
        ['<C-e>'] = cmp.mapping.abort(),
    }),

    -- Override documentation view function to respect toggle
    view_override = function(self, view)
        if view == 'docs' and not docs_enabled then
            return false
        end
        return true
    end,
})

-- Command-line completion for '/' and '?'
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline({
        ['<Up>'] = { c = cmp.mapping.select_prev_item() },
        ['<Down>'] = { c = cmp.mapping.select_next_item() },
        ['<Tab>'] = { c = cmp.mapping.select_next_item() },
        ['<S-Tab>'] = { c = cmp.mapping.select_prev_item() },
        ['<CR>'] = { c = cmp.mapping.confirm({ select = false }) },
    }),
    sources = {
        { name = 'buffer', max_item_count = 200 }
    },
    view = {
        entries = { name = 'custom' }
    },
    window = {
        completion = {
            border = 'rounded',
            scrollbar = true,
            max_height = 5,
        },
    },
    performance = {
        max_view_entries = 200,
    },
})

-- Command-line completion for ':'
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
        ['<Up>'] = { c = cmp.mapping.select_prev_item() },
        ['<Down>'] = { c = cmp.mapping.select_next_item() },
        ['<Tab>'] = { c = cmp.mapping.select_next_item() },
        ['<S-Tab>'] = { c = cmp.mapping.select_prev_item() },
        ['<CR>'] = { c = cmp.mapping.confirm({ select = false }) },
    }),
    sources = cmp.config.sources({
        { name = 'path', max_item_count = 200 }
    }, {
        { name = 'cmdline', max_item_count = 200 }
    }),
    view = {
        entries = { name = 'custom' }
    },
    window = {
        completion = {
            border = 'rounded',
            scrollbar = true,
            max_height = 5,
        },
    },
    performance = {
        max_view_entries = 200,
    },
})

-- LSP auto-completion setup with auto-pairs support
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Example LSP setup (adjust for your LSP servers)
-- require('lspconfig').clangd.setup({ capabilities = capabilities })
-- require('lspconfig').lua_ls.setup({ capabilities = capabilities })
