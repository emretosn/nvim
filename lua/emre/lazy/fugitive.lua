return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

        local emre_Fugitive = vim.api.nvim_create_augroup("emre_Fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = emre_Fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}
                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd.Git('push')
                end, opts)

                -- rebase always
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd.Git({'pull',  '--rebase'})
                end, opts)

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
            end,
        })

        -- Add the current file to the staging area
        vim.keymap.set("n", "<leader>ga", function()
            vim.cmd.Git("add %")
        end, { desc = "Git Add Current File" })

        -- Add all changes in the current directory
        vim.keymap.set("n", "<leader>gA", function()
            vim.cmd.Git("add .")
        end, { desc = "Git Add All Changes" })

        vim.keymap.set("n", "<leader>gc", vim.cmd.Git("commit"), { desc = "Git Commit" })

        vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
    end
}
