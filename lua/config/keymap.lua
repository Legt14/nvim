local kmap = function(mode, key, effect)
  vim.keymap.set(mode, key, effect, { silent = true, noremap = true })
end


