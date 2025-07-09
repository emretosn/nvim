return {
    'ojroques/nvim-osc52',

    config = function()
        require('osc52').setup({
            max_length = 0, -- no limit
            silent = true, -- do not echo messages
            trim = true, -- trim trailing whitespace
            silent_yank = true, -- do not echo yanked text
            copy_hlgroup = 'Visual', -- highlight group used when copying text
        })
    end,
}
