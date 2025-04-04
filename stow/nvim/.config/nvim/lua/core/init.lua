require('core.remap')
require('core.plugins')

-- Always require plugin_config after remap since plugins need the remap of <leader>.
-- Otherwise they will use the default leader: backslash '\'
require('core.plugin_config')
require('core.options')
