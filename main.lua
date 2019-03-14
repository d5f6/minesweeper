--[[
  Minesweeper

  Author: d5f6
]]

require 'src/dependencies'

function love.load()
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT)
  
  love.graphics.setFont(gFonts['pixeled'])
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end

function love.update(dt)
end

function love.draw()
  push:start()
  love.graphics.print('000')
  push:finish()
end
