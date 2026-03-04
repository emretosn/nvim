return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter').install({
                "go", "lua", "python", "bash", "javascript", "typescript", "c", "cpp", "rust", "java", "yaml", "jsdoc", "vimdoc",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end
}
