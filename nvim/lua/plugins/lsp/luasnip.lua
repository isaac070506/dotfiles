------------------------
------- LuaSnip --------
------------------------

-- LuaSnip.nvim: Snippet engine
-- URL: https://github.com/L3MON4D3/LuaSnip

return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { "/home/isaac/.config/nvim/snippets" },
    })
    require('luasnip').config.set_config({
      update_events = "TextChanged,TextChangedI",
    })
  end,
}
