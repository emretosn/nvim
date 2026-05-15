return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                "go", "lua", "python", "bash", "javascript", "typescript", "c", "cpp", "rust", "java", "yaml", "jsdoc", "vimdoc",
            },
            highlight = { enable = true },
        })
    end
}
