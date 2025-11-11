-- ===================================
-- Auto Sessions for Big Project work 
-- ===================================
require("auto-session").setup({
    log_level = "error",
    auto_session_enable_last_session = false,
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_suppress_dirs = { "~/", "/", "/tmp" },
    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/", -- keep sessions in one place
    -- Optional: hook for pre-save cleanup
    pre_save_cmds = { "NvimTreeClose", "cclose" },
})


