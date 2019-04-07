--[[
  GridTile Class
]]

GridTile = Class{}

function GridTile:init(isBomb)
  self.isBomb = isBomb
  self.isHidden = true
  self.numBombNeighbors = 0
end

function GridTile:update(dt)

end

function GridTile:render(x, y)
  if self.isHidden then
    love.graphics.draw(gTextures['tile'], x, y)
  else
    if self.isBomb then
      love.graphics.draw(gTextures['tile-depressed'], x, y)
    else
      love.graphics.draw(gTextures['bomb'], x, y)
    end
  end
end
