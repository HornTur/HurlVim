require("gitsigns")
    .setup({
        signs =
            {
                add = {text = "│"},
                change = {text = "│"},
                delete = {text = "契"},
                topdelete = {text = "‾"},
                changedelete = {text = "~"},
                untracked = {text = "┆"},
            },
        signcolumn = true,
    })
