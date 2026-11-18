return {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "general"
      vim.g.vimtex_view_general_viewer = "open"
      vim.g.vimtex_view_general_options = "-a Preview @pdf"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_view_automatic = 1

      vim.g.vimtex_compiler_latexmk = {
        aux_dir = ".build",
        options = {
          "-verbose",
          "-file-line-error",
          "-interaction=nonstopmode",
        },
      }

      vim.api.nvim_create_autocmd("User", {
        pattern = "VimtexEventCompileSuccess",
        callback = function()
          vim.cmd("VimtexView")
        end,
      })
    end
}
