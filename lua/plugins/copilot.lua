return{
  {
    "github/copilot.vim",
    cmd = "Copilot",
config = function()
    end,
  }
--     {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
-- require('copilot').setup({
--   panel = {
--     enabled = true,
--     auto_refresh = false,
--     keymap = {
--       jump_prev = "[[",
--       jump_next = "]]",
--       accept = "<CR>",
--       refresh = "gr",
--       open = "<M-CR>"
--     },
--     layout = {
--       position = "bottom", -- | top | left | right
--       ratio = 0.4
--     },
--   },
--   suggestion = {
--     enabled = true,
--     auto_trigger = false,
--     debounce = 75,
--     keymap = {
--       accept = "<M-l>",
--       accept_word = false,
--       accept_line = false,
--       next = "<M-]>",
--       prev = "<M-[>",
--       dismiss = "<C-]>",
--     },
--   },
--   filetypes = {
--     python = true,
--     javascript = true, -- allow specific filetype
--     typescript = true, -- allow specific filetype
--     ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
--     ["."] = false,
--   },
--   copilot_node_command = 'node', -- Node.js version must be > 18.x
--   server_opts_overrides = {},
-- })
--   end,
-- }

}
