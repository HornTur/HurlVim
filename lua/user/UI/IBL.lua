local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
       local colors = { "#4a4a4a", "#555555", "#606060", "#6b6b6b", "#767676", "#818181" }
    for i, color in ipairs(colors) do
        vim.api.nvim_set_hl(0, "IblIndent" .. i, { fg = color, nocombine = true })
    end
    -- Scope highlight stays blue
    vim.api.nvim_set_hl(0, "IblScope", { fg = "#007acc", bold = true, nocombine = true })
end)

require("ibl").setup({
    indent = {
        char = "│",
        highlight = { "IblIndent1", "IblIndent2", "IblIndent3", "IblIndent4", "IblIndent5", "IblIndent6" },
        smart_indent_cap = true,
    },
    scope = {
        enabled = true,
        highlight = "IblScope",
        show_start = true,
        show_end = false,
        injected_languages = true,
    },
    whitespace = {
        highlight = { "IblWhitespace" },
        remove_blankline_trail = true,
    },
    exclude = {
        filetypes = { "help", "alpha", "dashboard", "terminal", "lazy" },
        buftypes  = { "terminal", "nofile" },
    },
})
