require("edu.remap")
require("edu.set")
vim.cmd([[
  let $LANG = 'en_US.UTF-8'
  let $LC_ALL = 'en_US.UTF-8'
]])

-- go linter on save
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("Linter", { clear = true }),
  callback = function()
    require("lint").try_lint()
  end,
})
