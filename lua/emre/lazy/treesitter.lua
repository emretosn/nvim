return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "go", "lua", "python", "bash", "javascript", "typescript", "c", "cpp", "rust", "java", "yaml", "jsdoc", "vimdoc", "bicep",
        },
        highlight = { enable = true },
    }
}
