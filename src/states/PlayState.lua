--[[
  PlayState Class
]]

PlayState = Class{__includes = BaseState}

function PlayState:init()
  self.gameGrid = GameGrid(GRID_WIDTH, GRID_HEIGHT)
end


function PlayState:update(dt) 
  self.gameGrid:update(dt)
end

function PlayState:render()
  love.graphics.clear(0.2, 0.2, 0.2, 1)
  love.graphics.print('120')
  love.graphics.printf('0', 0, 0, VIRTUAL_WIDTH, 'right')

  self.gameGrid:render()
end
