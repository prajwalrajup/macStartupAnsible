---@type ChadrcConfig
local M = {}

-- Define the theme
M.ui = { theme = 'oxocarbon' }

-- Define key mappings
local function setup_keybindings()
    -- Other key bindings
    vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
end

-- Call the function to set up key bindings
setup_keybindings()

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
