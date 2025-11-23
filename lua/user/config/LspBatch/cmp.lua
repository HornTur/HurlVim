local cmp = require('cmp')
local luasnip = require('luasnip')

-- Diagnostic signs configuration
local signs = {
    Error = "✘ ",
    Warn = "⚠ ",
    Hint = "󰌶 ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Diagnostic configuration
vim.diagnostic.config({
    virtual_text = false,  -- Disable inline virtual text
    signs = true,          -- Enable gutter signs (works in insert mode)
    underline = true,      -- Underline errors
    update_in_insert = true, -- Update diagnostics in insert mode
    severity_sort = true,
    float = {
        border = 'single',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- Show diagnostics popup only in normal mode when cursor is on error
vim.api.nvim_create_autocmd('CursorHold', {
    pattern = '*',
    callback = function()
        if vim.fn.mode() == 'n' then -- Only in normal mode
            vim.diagnostic.open_float(nil, {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
            })
        end
    end
})

-- Adjust the delay for CursorHold
vim.opt.updatetime = 500 -- 500ms delay

-- Enable mouse support for scrolling
vim.opt.mouse = 'a'

cmp.setup({
    -- ❌ NO GHOST TEXT (banned forever!)
    experimental = {
        ghost_text = false,
    },

    -- 🎨 Completion Window Styling - 4 ITEMS FOR TEXT EDITOR
    window = {
        completion = {
            border = "single",
            scrollbar = '║',
            col_offset = -3,
            side_padding = 1,
        },
        documentation = cmp.config.disable,
    },

    -- 📋 Formatting (Icons + Short Labels + Abbreviations)
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
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
        { name = 'luasnip',  priority = 750 },
        { name = 'buffer',   priority = 500, keyword_length = 3 },
        { name = 'path',     priority = 250 },
    }),

    -- ⌨️ Keymaps for INSERT MODE
    mapping = cmp.mapping.preset.insert({
        -- Arrow keys and scroll wheel for navigation
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

        ['<ScrollWheelDown>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<ScrollWheelUp>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),

        -- Scroll through many items
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),

        -- ENTER to select ONLY if explicitly selected
        ['<CR>'] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() then
                    if cmp.get_selected_entry() then
                        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                    else
                        cmp.abort()
                        fallback()
                    end
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if cmp.visible() and cmp.get_selected_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
        }),

        -- TAB to select
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if cmp.get_selected_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
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

-- 📝 COMMAND-LINE COMPLETION - FIXED for proper cmdline behavior
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
        -- Navigation
        ['<Down>'] = { c = cmp.mapping.select_next_item() },
        ['<Up>'] = { c = cmp.mapping.select_prev_item() },
        ['<C-n>'] = { c = cmp.mapping.select_next_item() },
        ['<C-p>'] = { c = cmp.mapping.select_prev_item() },

        -- TAB to navigate and select
        ['<Tab>'] = {
            c = function()
                if cmp.visible() then
                    cmp.select_next_item()
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

        -- ENTER to confirm selection
        ['<CR>'] = {
            c = function(fallback)
                if cmp.visible() and cmp.get_selected_entry() then
                    cmp.confirm({ select = false })
                else
                    fallback()
                end
            end
        },

        -- ESC/Ctrl+e to close
        ['<C-e>'] = { c = cmp.mapping.abort() },
    }),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
    }),
    window = {
        completion = {
            border = "single",
            scrollbar = '║',
        },
    },
})

-- 📝 SEARCH COMPLETION - FIXED
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline({
        ['<Down>'] = { c = cmp.mapping.select_next_item() },
        ['<Up>'] = { c = cmp.mapping.select_prev_item() },
        ['<Tab>'] = {
            c = function()
                if cmp.visible() then
                    cmp.select_next_item()
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
        ['<CR>'] = {
            c = function(fallback)
                if cmp.visible() and cmp.get_selected_entry() then
                    cmp.confirm({ select = false })
                else
                    fallback()
                end
            end
        },
    }),
    sources = {
        { name = 'buffer' }
    },
    window = {
        completion = {
            border = "single",
            scrollbar = '║',
        },
    },
})

-- 🔥 FORCE 4 ITEMS IN EDITOR, 5 IN CMDLINE
vim.opt.pumheight = 4 -- Default for insert mode (text editor)

-- Override for cmdline mode
vim.api.nvim_create_autocmd("CmdlineEnter", {
    callback = function()
        vim.opt.pumheight = 5 -- 5 items in command mode
    end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        vim.opt.pumheight = 4 -- Back to 4 items in editor
    end,
})

-- LSP setup to disable hover and signature help popups
local on_attach = function(client, bufnr)
    -- Disable automatic hover
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
            silent = true,
            focusable = false,
        }
    )

    -- Disable signature help
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
            silent = true,
            focusable = false,
        }
    )
end

-- Example LSP setup
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Add your LSP servers here
-- require('lspconfig')['lua_ls'].setup { capabilities = capabilities, on_attach = on_attach }
