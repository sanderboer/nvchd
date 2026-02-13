return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      { "folke/snacks.nvim", opts = { input = { enabled = true } } },
    },
    lazy = false,
    config = function()
      -- External process support: auto-detect opencode on port 3000
      -- Run `opencode` in another terminal and this will connect to it
      vim.g.opencode_opts = {
        -- port = 3000, -- Uncomment to use specific port instead of auto-detect
        -- host = "127.0.0.1", -- Uncomment for non-localhost
      }

      vim.opt.autoread = true

      local ok, oc = pcall(require, "opencode")
      if not ok then
        return
      end

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
      end

      -- Core navigation
      map("n", "<leader>ot", function() oc.toggle() end, "Toggle opencode")
      map("n", "<leader>on", function() oc.command("session_new") end, "New opencode session")
      
      -- Ask with enhanced input (completion, highlighting, normal mode movement)
      map("n", "<leader>oA", function() oc.ask() end, "Ask opencode")
      map("n", "<leader>oa", function() oc.ask("@cursor: ") end, "Ask about cursor")
      map("v", "<leader>oa", function() oc.ask("@selection: ") end, "Ask about selection")
      map("n", "<leader>of", function() oc.ask("@file: ") end, "Ask about file")
      map("n", "<leader>ob", function() oc.ask("@buffer: ") end, "Ask about buffer")
      
      -- Prompt picker for quick one-off prompts
      map({ "n", "v" }, "<leader>os", function() oc.select() end, "Select opencode prompt")
      
      -- Quick actions
      map("n", "<leader>oe", function() oc.prompt("Explain @cursor and its context") end, "Explain this code")
      map("n", "<leader>or", function() oc.prompt("Review @cursor for issues") end, "Review this code")
      map("n", "<leader>of", function() oc.prompt("Fix @cursor") end, "Fix this code")
      map("n", "<leader>ot", function() oc.prompt("Write tests for @cursor") end, "Write tests for this")
      
      -- Message navigation
      map("n", "<leader>oy", function() oc.command("messages_copy") end, "Copy last response")
      map("n", "<C-S-u>", function() oc.command("messages_half_page_up") end, "Messages page up")
      map("n", "<C-S-d>", function() oc.command("messages_half_page_down") end, "Messages page down")

      -- Event handling: reload buffers when opencode edits files
      vim.api.nvim_create_autocmd("User", {
        pattern = "OpencodeEvent",
        callback = function(args)
          local event = args.data
          if event and event.type == "file_edited" then
            -- Buffer will auto-reload due to vim.opt.autoread = true
            vim.notify("Opencode edited: " .. (event.file or "unknown"), vim.log.levels.INFO)
          end
        end,
      })

      -- Optional: sync opencode CWD with Neovim on directory change
      vim.api.nvim_create_autocmd("DirChanged", {
        pattern = "*",
        callback = function()
          -- Only if connected to external process
          -- oc.command("cwd " .. vim.fn.getcwd())
        end,
      })
    end,
  },
}
