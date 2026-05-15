return {
  "scalameta/nvim-metals",
  ft = { "scala", "sbt", "java" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = function()
    local metals_config = require("metals").bare_config()
    metals_config.on_attach = function(client, bufnr)
      require("metals").default_on_attach(client, bufnr)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
      vim.keymap.set("n", "<leader>F", require("metals").format, { buffer = bufnr, desc = "Format Document" })
    end

    return metals_config
  end,
  config = function(self, metals_config)
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = self.ft,
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end
}
