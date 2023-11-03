---@type ChadrcConfig
local M = {}

M.ui = { theme = 'oxocarbon' }

-- Define key mappings
local function setup_keybindings()
    -- Other key bindings
    vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
end

-- Call the function to set up key bindings
setup_keybindings()

return M
