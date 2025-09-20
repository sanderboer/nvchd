return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      { "folke/snacks.nvim", opts = { input = { enabled = true } } },
    },
    lazy = false, -- ensure eager load so keymaps register immediately
    config = function()
      vim.g.opencode_opts = {}
      vim.opt.autoread = true

      local ok, oc = pcall(require, "opencode")
      if not ok then
        return
      end

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { desc = desc, silent = true })
      end

      map("n", "<leader>ot", function() oc.toggle() end, "Toggle opencode")
      map("n", "<leader>oA", function() oc.ask() end, "Ask opencode")
      map("n", "<leader>oa", function() oc.ask("@cursor: ") end, "Ask opencode about this")
      map("v", "<leader>oa", function() oc.ask("@selection: ") end, "Ask opencode about selection")
      map("n", "<leader>on", function() oc.command("session_new") end, "New opencode session")
      map("n", "<leader>oy", function() oc.command("messages_copy") end, "Copy last opencode response")
      -- NOTE: Many terminals do not distinguish <S-C-u>/<S-C-d>; <C-u>/<C-d> might be more portable
      map("n", "<S-C-u>", function() oc.command("messages_half_page_up") end, "Messages half page up")
      map("n", "<S-C-d>", function() oc.command("messages_half_page_down") end, "Messages half page down")
      map({ "n", "v" }, "<leader>os", function() oc.select() end, "Select opencode prompt")
      map("n", "<leader>oe", function() oc.prompt("Explain @cursor and its context") end, "Explain this code")
    end,
  },
}
