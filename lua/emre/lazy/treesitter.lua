return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter').install({
                "vimdoc", "go", "python", "javascript", "typescript", "c", "cpp", "lua", "rust",
                "jsdoc", "bash", "java", "yaml",
        })
    end
}
