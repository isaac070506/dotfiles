-----------------
--- Hologram ----
-----------------

-- Hologram.nvim: Allows you to view inline images directly inside a Neovim buffer
-- URL: https://github.com/edluffy/hologram.nvim

return {
  "edluffy/hologram.nvim",
  config = function()
    require('hologram').setup {
      auto_display = true -- WIP automatic markdown image display, may be prone to breaking
    }
  end,
}
