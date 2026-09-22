return {
    "voldikss/vim-floaterm",
    keys = {
        { "<leader>tt", "<cmd>FloatermToggle<CR>", desc = "Toggle Floaterm" },
        { "<leader>tt", "<C-\\><C-n><cmd>FloatermToggle<CR>", mode = "t", desc = "Toggle Floaterm" },
    },
    init = function()
        vim.g.floaterm_width = 0.9
        vim.g.floaterm_height = 0.9
        vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
        vim.g.floaterm_title = ""
    end,
}
