-- Compact blink.cmp configuration for small screens
-- Add this to your blink.cmp setup

require('blink.cmp').setup({
    completion = {
        menu = {
            -- Limit the height of the completion menu
            max_height = 10, -- Maximum number of items to show (default: 20)

            -- Make the menu more compact
            draw = {
                columns = {
                    { "kind_icon" },
                    { "label",    "label_description", gap = 1 },
                },

                -- Adjust component widths
                components = {
                    kind_icon = {
                        width = { fill = false },
                    },
                    label = {
                        width = { fill = true, max = 30 }, -- Limit label width
                    },
                    label_description = {
                        width = { fill = true, max = 20 }, -- Limit description width
                    },
                },
            },

            -- Window border and styling
            border = 'rounded', -- Options: 'none', 'single', 'double', 'rounded', 'solid', 'shadow'

            -- Scrollbar configuration
            scrollbar = true,

            -- Auto-show behavior
            auto_show = true,
        },

        -- Documentation window settings
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,

            window = {
                max_width = 50,  -- Limit documentation width
                max_height = 15, -- Limit documentation height
                border = 'rounded',
            },
        },
    },

    -- Signature help configuration
    signature = {
        enabled = true,
        window = {
            max_width = 60,  -- Limit signature help width
            max_height = 10, -- Limit signature help height
            border = 'rounded',
        },
    },

    -- Appearance settings
    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono', -- Options: 'mono', 'normal'
    },
})

-- Alternative minimal configuration for very small screens
--[[
require('blink.cmp').setup({
  completion = {
    menu = {
      max_height = 8,
      draw = {
        columns = { { "kind_icon" }, { "label", gap = 1 } },
        components = {
          label = { width = { fill = true, max = 25 } },
        },
      },
    },
    documentation = {
      window = {
        max_width = 40,
        max_height = 10,
      },
    },
  },
})
--]]
