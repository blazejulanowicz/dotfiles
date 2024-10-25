return {
  {
    "github/copilot.vim",
    lazy = false,
    init = function()
      -- Dismiss copilot suggestion when cmp menu is opened
      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("menu_opened", function()
          vim.cmd([[
            if copilot#Enabled()
              call copilot#Dismiss()
            endif
          ]])
        end)
      end
      -- Settings
      vim.g.copilot_filetypes = {
        ["*"] = false,
        rust = true,
        python = true,
        bash = true,
        lua = true,
        typescript = true,
        javascript = true,
        typescriptreact = true,
        javascriptreact = true,
      }
      vim.g.copilot_no_tab_map = true
      -- Keymaps
      vim.keymap.set("i", "<C-y>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
      vim.keymap.set("i", "<C-n>", "<Plug>(copilot-next)")
      vim.keymap.set("i", "<C-p>", "<Plug>(copilot-next)")
      vim.keymap.set("i", "<C-e>", "<Plug>(copilot-dismiss)")
      vim.keymap.set("i", "<C-a>", "<Plug>(copilot-suggest)")
    end,
  },
}
