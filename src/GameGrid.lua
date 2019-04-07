--[[
  GameGrid Class
]]

GameGrid = Class{}

function GameGrid:init(width, height)
  self.width = width
  self.height = height
  self.leftOffset = (VIRTUAL_WIDTH - self.width * TILE_SIZE) / 2

  self.grid = {}

  for y = 1, self.height do
    table.insert(self.grid, {})

    for x = 1, self.width do
      local isBomb = math.random(2) and true or false
      local gridTile = GridTile(isBomb)

      table.insert(self.grid[y], gridTile)
      
      local isHidden = math.random(2) and true or false
      gridTile.isHidden = isHidden
    end
  end
end

function GameGrid:update(dt)
end

function GameGrid:render()
  
  for y = 1, self.height do
    for x = 1, self.width do
      love.graphics.draw(grid[x][y] == 1 
        and gTextures['tile'] 
        or gTextures['tile-depressed'],
        self.leftOffset + (x - 1) * TILE_SIZE, TOP_OFFSET + (y - 1) * TILE_SIZE)
    end
  end
end