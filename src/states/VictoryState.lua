--[[
  VictoryState Class
]]

VictoryState = Class{__includes = BaseState}

function VictoryState:update(dt) 
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateMachine:change('play')
  end
end

function VictoryState:render() 
  love.graphics.printf('You win!', 0, VIRTUAL_HEIGHT / 2 - 8, VIRTUAL_WIDTH, 'center')
  love.graphics.printf('Press Enter to play', 0, VIRTUAL_HEIGHT / 2 + 16, VIRTUAL_WIDTH, 'center')
end