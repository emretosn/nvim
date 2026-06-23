return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        ts.setup()

        local ensure_installed = {
            "go", "lua", "python", "bash", "javascript", "typescript",
            "c", "cpp", "rust", "java", "yaml", "jsdoc", "vimdoc", "bicep", "terraform",
        }

        -- Install any missing parsers.
        local installed = ts.get_installed()
        local to_install = vim.tbl_filter(function(lang)
            return not vim.tbl_contains(installed, lang)
        end, ensure_installed)
        if #to_install > 0 then
            ts.install(to_install)
        end

        -- Enable highlighting for buffers whose language has a parser.
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
                if lang and vim.tbl_contains(ts.get_installed(), lang) then
                    pcall(vim.treesitter.start, ev.buf, lang)
                end
            end,
        })
    end,
}
