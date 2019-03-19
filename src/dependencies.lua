--[[
  dependencies
]]

love.graphics.setDefaultFilter('nearest', 'nearest')

push = require 'lib/push'

require 'src/constants'

gTextures = {
  ['tile'] = love.graphics.newImage('graphics/tile.png'),
  ['tile-depressed'] = love.graphics.newImage('graphics/tile_depressed.png'),
}

gFonts = {
  ['poco'] = love.graphics.newFont('fonts/Poco.ttf', 20),
  ['pixeled'] = love.graphics.newFont('fonts/Pixeled.ttf', 10),
  ['start'] = love.graphics.newFont('fonts/start.ttf', 16),
}
