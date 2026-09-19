---------------------
---- Treesitter -----
---------------------

-- Treesitter.nvim: Install, update and remove Treesitter parsers
-- URL: https://github.com/nvim-treesitter/nvim-treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.install = { "python" }
  end
}
