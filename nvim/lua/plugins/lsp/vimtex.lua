----------------------------
---------- VimTex ----------
----------------------------

--VimTex.nvim: Syntax plugin for LaTeX files
--URL: https://github.com/lervag/vimtex

return {
  "lervag/vimtex",
  ft = { "tex" },
  lazy = false,
  --- Este apartado es enteramente generado por Gemini AI, no confiar en que se que hace
  config = function()
    -- Desactiva la función vimtex#matchparen que satura el CPU
    vim.g.vimtex_matchparen_enabled = 0

    -- Reduce el rango de líneas que examina VimTeX hacia arriba y abajo
    vim.g.vimtex_delim_stopline = 50

    -- (Opcional) Si aún notas tirones, desactiva el ocultamiento automático
    vim.g.vimtex_syntax_conceal_disable = 1
  end,
  ---------------------------------------------------------------------------------------
  init = function()
    vim.g.vimtex_view_forward_search_on_start = 0
    -- vim.g.vimtex_syntax_enabled = 0

    vim.g.vimtex_view_method = "general"

    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = "build",
      -- continuous = 0,
      executable = "latexmk",
    }

    vim.g.vimtex_view_automatic = 0

    -- You need to add SumatraPDF to your windows path.
    -- Steps:
    -- Windows + r and sysdm.cpl, then CR.
    -- See advanced options
    -- Go to “environment variables”
    -- Search for the "PATH" variable
    -- Edit it and add the path where you installed Sumatra
    -- Also, see :help vimtex-faq-sumatrapdf-wsl

    -- vim.g.vimtex_view_general_viewer = 'SumatraPDF.exe' --- if you didn't copy the script
    vim.g.vimtex_view_general_viewer = vim.fn.expand("~/.local/bin/sumatrapdf.sh")
    vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

    -- vim.g.vimtex_view_general_viewer = 'okular'
    -- vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'

    vim.g.vimtex_mappings_enabled = 0 -- Go to .../after/ftplugin/tex.lua to see the custom keymaps
    vim.g.vimtex_imaps_enabled = 0    -- Disable insert keymaps

    -- vim.g.vimtex_fold_enabled = 1

    -- Some common errors or warnings you might want to ignore
    -- vim.g.vimtex_quickfix_ignore_filters = {
    --   [[Overfull \\vbox]],
    --   [[Underfull \\hbox]],
    --   [[Overfull \\hbox]],
    --   [[LaTeX Warning: .\+ float specifier changed to]],
    --   [[LaTeX hooks Warning]],
    --   [[Package siunitx Warning: Detected the "physics" package:]],
    --   [[Package hyperref Warning: Token not allowed in a PDF string]],
    -- }
  end,
}
