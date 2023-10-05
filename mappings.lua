---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>gg"] = { ":LazyGit<CR>", "open LazyGit", opts = { nowait = true } },
    ["<leader>pm"] = { ":Mason<CR>", "open Mason", opts = { nowait = true } },
    ["|"] = { ":vsplit<CR>", "open a vertical split", opts = { nowait = true } },
    ["<leader>mpo"] = { ":PeekOpen<CR>", "preview current markdown file", opts = { nowait = true } },
    ["<leader>mpc"] = { ":PeekClose<CR>", "close preview of current markdown file", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<leader>gec"] = { ":Gen Enhance_Code<CR>", "Use gen.nvim and an LLM to enhance code", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
