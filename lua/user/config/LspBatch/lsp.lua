-- =====================================================
-- Chad Coder LSP Giant ⚡ (Future-Proof, Nvim 0.12+)
-- =====================================================
-- Pure vim.lsp.config + vim.lsp.enable (no lspconfig)
-- =====================================================

-- 0. Disable line numbers
vim.wo.number = false
vim.wo.relativenumber = false

-- 1. on_attach: keymaps
local function on_attach(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    local map = vim.keymap.set
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    map("n", "<leader>f_", function() vim.lsp.buf.format { async = true } end, opts)
end
local cmp = require("cmp")

cmp.setup({
  window = {
    documentation = cmp.config.disable,  -- disables the side floating doc box
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  })
})
-- 2. Capabilities (for cmp-nvim-lsp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
pcall(function()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
end)

-- 3. Default config
local default_config = {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- 4. Servers
local servers = {
    -- Core
    bashls        = { cmd = { "bash-language-server", "start" }, filetypes = { "sh", "bash" } },
    jsonls        = { cmd = { "vscode-json-language-server", "--stdio" }, filetypes = { "json" } },
    yamlls        = { cmd = { "yaml-language-server", "--stdio" }, filetypes = { "yaml", "yml" } },
    dockerls      = { cmd = { "docker-langserver", "--stdio" }, filetypes = { "dockerfile" } },
    marksman      = { cmd = { "marksman", "server" }, filetypes = { "markdown" } },

    -- Web
    html          = { cmd = { "vscode-html-language-server", "--stdio" }, filetypes = { "html" } },
    cssls         = { cmd = { "vscode-css-language-server", "--stdio" }, filetypes = { "css", "scss", "less" } },
    tsserver      = { cmd = { "typescript-language-server", "--stdio" }, filetypes = { "javascript", "typescript" } },
    eslint        = { cmd = { "vscode-eslint-language-server", "--stdio" }, filetypes = { "javascript", "typescript" } },

    -- System
    clangd        = { cmd = { "clangd", "--background-index" }, filetypes = { "c", "cpp" } },
    asm_lsp       = { cmd = { "asm-lsp" }, filetypes = { "asm", "s" } },
    cmake         = { cmd = { "cmake-language-server" }, filetypes = { "cmake" } },
    vimls         = { cmd = { "vim-language-server", "--stdio" }, filetypes = { "vim" } },

    -- Scripting
    pyright       = { cmd = { "pyright-langserver", "--stdio" }, filetypes = { "python" } },

    lua_ls        = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        handlers = {
            ["%progress"] = function() end,
        },
        settings = {
            Lua = {
                runtime = { version = "Lua 5.4" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                    checkThirdParty = false,
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = { enable = false },
            },
        },
    },

    -- Extra Chad Power
    rust_analyzer = { cmd = { "rust-analyzer" }, filetypes = { "rust" } },
    -- gopls         = { cmd = { "gopls" }, filetypes = { "go" } },

    -- Golang Lsp
    gopls = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      -- PERFORMANCE: Critical settings
      analyses = {
        unusedparams = true,
        shadow = false,  -- Disable expensive analysis
        unusedwrite = false,
        useany = false,
      },
      
      -- Reduce completion load
      completeUnimported = true,
      completionBudget = "100ms",  -- Cap completion time
      
      -- Matcher settings
      matcher = "Fuzzy",
      deepCompletion = false,  -- CRITICAL: Disable deep search
      
      -- Reduce semantic token load
      semanticTokens = false,
      
      -- Hints (disable if still slow)
      hints = {
        assignVariableTypes = false,
        compositeLiteralFields = false,
        compositeLiteralTypes = false,
        constantValues = false,
        functionTypeParameters = false,
        parameterNames = false,
        rangeVariableTypes = false,
      },
      
      -- Staticcheck can be slow
      staticcheck = false,
      
      -- Codelens overhead
      codelenses = {
        generate = false,
        gc_details = false,
        test = false,
        tidy = false,
      },
    },
  },
},
    phpactor      = { cmd = { "phpactor", "language-server" }, filetypes = { "php" } },
    GDScript = {
  cmd = { "nc", "127.0.0.1", "6008" },
  filetypes = { "gd", "gdscript" },
  root_dir = function()
      return vim.fn.expand("$HOME/Langs/Gdscript")
  end,

}
}

    -- Some Godot!

-- 5. Setup all
for server, opts in pairs(servers) do
    vim.lsp.config(server, vim.tbl_deep_extend("force", default_config, opts))
end
vim.keymap.set("n", "<leader>la", vim.diagnostic.open_float, { desc = "Show Diagnostics" })

-- 6. Enable all 🎉
vim.lsp.enable(vim.tbl_keys(servers))

-- 7. Theme (example: dark, easy-to-read)
vim.cmd [[
    colorscheme desert
    highlight Normal guibg=NONE ctermbg=NONE
]]
