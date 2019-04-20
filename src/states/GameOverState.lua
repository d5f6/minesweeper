--[[
  GameOverState Class
]]

GameOverState = Class{__includes = BaseState}

function GameOverState:render()
  love.graphics.printf('Game Over', 0, VIRTUAL_HEIGHT / 2 - 8, VIRTUAL_WIDTH, 'center')
end