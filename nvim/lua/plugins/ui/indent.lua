-----------------
-- IndentMini ---
-----------------

--IndentMini.nvim: Indentation plugin for looks and performance
--URL: https://github.com/nvimdev/indentmini.nvim

--> Format for indent lines
return {
  "nvimdev/indentmini.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("indentmini").setup({
      char = "▏", -- You can use "▏", "╎", "┆", etc.
      exclude = { "help", "alpha", "dashboard", "lazy", "mason" },
      minlevel = 2,
    })

    --Highlight settings
    vim.cmd.highlight("default link IndentLine Comment")
    vim.cmd.highlight("IndentLineCurrent guifg=#C8C093")
  end,
}
