local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt;

autocmd("FileType", {
  pattern = { "gitcommit" },
  callback = function()
    opt.textwidth = 0
  end
})
