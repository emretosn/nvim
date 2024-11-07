return {
   "github/copilot.vim",

    config = function ()
        vim.g.copilot_enabled = true

        function ToggleCopilot()
            if vim.g.copilot_enabled then
                vim.print("Copilot DISABLED")
                vim.cmd("Copilot disable")
                vim.g.copilot_enabled = false
            else
                vim.print("Copilot ENABLED")
                vim.cmd("Copilot enable")
                vim.g.copilot_enabled = true
            end
        end

        vim.keymap.set('n', '<leader>cp', function() ToggleCopilot() end, { noremap = true, silent = true })
    end
}

