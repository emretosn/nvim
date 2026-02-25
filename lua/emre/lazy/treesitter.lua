return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "vimdoc", "go", "python", "javascript", "typescript", "c", "cpp", "lua", "rust",
                "jsdoc", "bash", "java",
            },
        })

        vim.treesitter.language.register("templ", "templ")
    end
}
