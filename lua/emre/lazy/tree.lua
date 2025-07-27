return {
    "nvim-tree/nvim-tree.lua",

    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },

    config = function()
        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            update_cwd = true,
            view = {
                width = 30,
                side = "left",
            },
            sort = {
                sorter = "case_sensitive",
            },
            filters = {
                dotfiles = true,
            },
        })

        -- Key mappings
        vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
}
