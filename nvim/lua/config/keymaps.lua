-------------------------
-------- Keymaps --------
-------------------------

local map = vim.keymap.set

local opts = { noremap = true, silent = true }

---=== Save and exit ===---
map("n", "<leader>w", "<cmd>w<CR>", opts)  --save
map("n", "<leader>x", "<cmd>wq<CR>", opts) --save and exit
map("n", "<leader>q", "<cmd>q<CR>", opts)  --exit
map("n", "<leader>Q", "<cmd>q!<CR>", opts) --forced exit


---=== Clear highlighted text ===---
map("n", "<leader>77", "<cmd>nohlsearch<CR>", opts)


---=== Commenter ===---
local comment = require("vim._comment")

map({ "n", "x" }, "<leader>c", function()
  return comment.operator()
end, { expr = true, desc = "Comment operator" })

map('n', '<leader>cc', function()
  return comment.operator() .. '_'
end, { expr = true, desc = 'Comment toggle current line' })

map('x', '<leader>cc', function()
  return comment.operator()
end, { expr = true, desc = 'Comment toggle (visual)' })


---=== Surround ===---
--For delete and change functions, the keymaps are the default ones
--Read more abut this in https://github.com/kylechui/nvim-surround
map("n", "<leader>as", "<Plug>(nvim-surround-normal)a", opts)        --surround around
map("n", "<leader>is", "<Plug>(nvim-surround-normal)iw", opts)       --inner word surround
map("n", "<leader>s", "<Plug>(nvim-surround-normal-cur)", opts)      --surround the line
map("n", "<leader>S", "<Plug>(nvim-surround-normal-cur-line)", opts) --surround the line whitin a block
map("v", "<leader>s", "<Plug>(nvim-surround-visual)", opts)          --surround the selection
map("v", "<leader>S", "<Plug>(nvim-surround-visual-line)", opts)     --surrouns the selection whitin a block


---=== Show a floating diagnosis ===---
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show floating diagnostic" })


---=== Navigation ===---
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<leader>n", "]s", opts)
map("n", "<leader>p", "[s", opts)
map("n", "<leader>=", "z=", opts)


local function OpenOilFloatHere()
  if vim.bo.filetype == "oil" then
    return
  end

  local oil = require("oil")
  local cwd = vim.fn.expand("%:p:h")

  oil.open_float(cwd)
  Try_open_preview(6, 20)
end

function GlobalOpenOil()
  if vim.bo.filetype == "oil" then
    return
  end

  local oil = require("oil")
  local current_buf = vim.api.nvim_get_current_buf()
  local current_file = vim.api.nvim_buf_get_name(current_buf)

  if current_file and current_file ~= "" then
    local dir = vim.fn.fnamemodify(current_file, ":h")
    oil.open(dir)
  else
    oil.open()
  end
  Try_open_preview(6, 30)
end

---=== Global keymap to open Oil in current buffer's directory ===---
map("n", "<leader>-", GlobalOpenOil, { desc = "Open Oil in current file's directory", silent = true })


---=== Global keymap to open Oil in current buffer's directory in float mode ===---
map("n", "-", OpenOilFloatHere, { desc = "Open Oil in current file'directory in float mode", silent = true })
