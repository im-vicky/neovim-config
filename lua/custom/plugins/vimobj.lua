return {
  'kana/vim-textobj-entire',
  dependencies = { 'kana/vim-textobj-user' }, -- required
  keys = {
    { 'ae', mode = { 'x', 'o' }, desc = 'Around entire file' },
    { 'ie', mode = { 'x', 'o' }, desc = 'Inner entire file' },
  },
}
