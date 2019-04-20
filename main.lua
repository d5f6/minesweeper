--[[
  Minesweeper

  Author: d5f6
]]

require 'src/dependencies'
require 'src/GameGrid'
require 'src/GridTile'

local gameGrid = GameGrid(GRID_WIDTH, GRID_HEIGHT)

function love.load()
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT)
  
  math.randomseed(os.time())

  grid = {}

  for y = 1, 10 do
    table.insert(grid, {})

    for x = 1, 10 do
      table.insert(grid[y], math.random(2))
    end
  end

  love.graphics.setFont(gFonts['start'])

  love.mouse.buttonsPressed = {}
end

function love.mouse.wasPressed(button)
  return love.mouse.buttonsPressed[button]
end

function love.mousepressed(x, y, button, istouch, pressed)
  love.mouse.buttonsPressed[button] = true
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end

function love.update(dt)
  gameGrid:update(dt)

  love.mouse.buttonsPressed = {}
end

function love.draw()
  push:start()

  love.graphics.clear(0.2, 0.2, 0.2, 1)
  love.graphics.print('120')
  love.graphics.printf('0', 0, 0, VIRTUAL_WIDTH, 'right')
  
  gameGrid:render()

  push:finish()
end
