require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<leader>ad'] = { 'hide' },
        ['<C-y>'] = { 'select_and_accept' },

        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
    },

    completion = {
        menu = {
            max_height = 5, -- Limit to 5 suggestions
            draw = {
                columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } },
            }
        },
        documentation = {
            auto_show = false,
            auto_show_delay_ms = 500,
        },
        list = {
            max_items = 5, -- Show maximum 5 items
        }
    },

    signature = {
        enabled = true
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
            lsp = {
                name = 'LSP',
                module = 'blink.cmp.sources.lsp',
                score_offset = 90,
            },
            path = {
                name = 'Path',
                module = 'blink.cmp.sources.path',
                score_offset = 3,
            },
            snippets = {
                name = 'Snippets',
                module = 'blink.cmp.sources.snippets',
                score_offset = 80,
            },
            buffer = {
                name = 'Buffer',
                module = 'blink.cmp.sources.buffer',
                score_offset = -3,
            },
        }
    },
})
