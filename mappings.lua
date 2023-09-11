---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>gg"] = { ":LazyGit<CR>", "open LazyGit", opts = { nowait = true } },
    ["<leader>pm"] = { ":Mason<CR>", "open Mason", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
