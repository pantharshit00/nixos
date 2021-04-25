--[[
  Config structure taken from https://github.com/yashguptaz/dotfiles 
  when switching from vim to lua based configuration.
  Ported to own style. 
]]
require('options')
require('plugins')
require('appearance')

require('plugins/default')
require('plugins/lsp')
require('plugins/efm-genenal-ls')
require('plugins/galaxyline')
require('plugins/telescope')
require('plugins/compe')
require('plugins/nvimtree')
