--[[
  Minesweeper

  Author: d5f6
]]

require 'src/dependencies'

local leftOffset = (VIRTUAL_WIDTH - GRID_WIDTH * TILE_SIZE) / 2
local topOffset = 40

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

  love.graphics.clear(0.2, 0.2, 0.2, 1)
  love.graphics.print('120')
  love.graphics.printf('0', 0, 0, VIRTUAL_WIDTH, 'right')
  
  for y = 1, 10 do
    for x = 1, 10 do
      love.graphics.draw(grid[x][y] == 1 
        and gTextures['tile'] 
        or gTextures['tile-depressed'],
        leftOffset + (x - 1) * TILE_SIZE, topOffset + (y - 1) * TILE_SIZE)
    end
  end

  push:finish()
end
