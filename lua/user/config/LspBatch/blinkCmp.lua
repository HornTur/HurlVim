-- Blink CMP Configuration
-- Put this in your init.lua or a separate config file

local cmp = require("blink.cmp")

cmp.setup({
    keymap = {
        preset = 'none',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-space>'] = { 'show', 'fallback' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    cmdline = {
        enabled = true,
        sources = {
            [':'] = { 'cmdline', 'path' },
            ['/'] = { 'buffer' },
            ['?'] = { 'buffer' },
        },
    },

    completion = {
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },

        menu = {
            enabled = true,
            min_width = 15,
            max_height = 5,
            border = 'single',
            winblend = 0,
            scrollbar = true,
            auto_show = true,

            draw = {
                columns = {
                    { 'kind_icon', gap = 1 },
                    { 'label',     'label_description', gap = 1 },
                    { 'kind' },
                },
            },
        },

        documentation = {
            auto_show = false,
            auto_show_delay_ms = 500,

            window = {
                min_width = 10,
                max_width = 50,
                max_height = 15,
                border = 'single',
                scrollbar = true,
            },
        },

        ghost_text = {
            enabled = false,
        },

        list = {
            selection = {
                preselect = true,
                auto_insert = true,
            },
        },
    },

    fuzzy = {
        use_typo_resistance = true,
        frecency = {
            enabled = true,
        },
        use_proximity = true,
    },

    signature = {
        enabled = true,
        window = {
            border = 'single',
        },
    },

    snippets = {
        expand = function(snippet)
            require('luasnip').lsp_expand(snippet)
        end,
        active = function(filter)
            if filter and filter.direction then
                return require('luasnip').jumpable(filter.direction)
            end
            return require('luasnip').in_snippet()
        end,
        jump = function(direction)
            require('luasnip').jump(direction)
        end,
    },
})

-- Setup LuaSnip for snippets
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()

-- Toggle documentation with <leader>ud
vim.keymap.set('n', '<leader>ud', function()
    local config = require('blink.cmp').config.completion.documentation
    config.auto_show = not config.auto_show
    if config.auto_show then
        vim.notify('Docs: ON', vim.log.levels.INFO)
    else
        vim.notify('Docs: OFF', vim.log.levels.INFO)
    end
end, { desc = 'Toggle Documentation' })
