--[[
  dependencies
]]

love.graphics.setDefaultFilter('nearest', 'nearest')

push = require 'lib/push'

require 'src/constants'

gFonts = {
  ['poco'] = love.graphics.newFont('fonts/Poco.ttf', 20),
  ['pixeled'] = love.graphics.newFont('fonts/Pixeled.ttf', 10),
  ['start'] = love.graphics.newFont('fonts/start.ttf', 20),
}
