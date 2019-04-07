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
      local isBomb = math.random(2) == 1 and true or false
      local gridTile = GridTile(isBomb)

      table.insert(self.grid[y], gridTile)
      
      local isHidden = math.random(2) == 1 and true or false
      gridTile.isHidden = isHidden
    end
  end

  self:calculateNumbers()
end

function GameGrid:calculateNumbers()
  for y = 1, self.height do
    for x = 1, self.width do
      local numBombNeighbors = 0

      -- check top left
      if x > 1 and y > 1 then
        if self.grid[y - 1][x - 1].isBomb then
          numBombNeighbors = numBombNeighbors + 1
        end
      end

      -- check top
      if y > 1 then
        if self.grid[y - 1][x].isBomb then
          numBombNeighbors = numBombNeighbors + 1
        end
      end

      -- check top right
      if y > 1 and x < self.width then
        if self.grid[y - 1][x + 1].isBomb then
          numBombNeighbors = numBombNeighbors + 1
        end
      end

      -- check left
      if x > 1 then
         if self.grid[y][x - 1].isBomb then
          numBombNeighbors = numBombNeighbors + 1
        end
      end

      -- check right
      if x < self.width then
         if self.grid[y][x + 1].isBomb then
          numBombNeighbors = numBombNeighbors + 1
        end
      end

      -- check bottom left
      if x > 1 and y < self.height then
        if self.grid[y + 1][x - 1].isBomb then
          numBombNeighbors = numBombNeighbors + 1
        end
      end

      -- check bottom
      if y < self.height then
        if self.grid[y + 1][x].isBomb then
          numBombNeighbors = numBombNeighbors + 1
        end
      end

      -- check bottom right
      if y < self.height and x < self.width then
        if self.grid[y + 1][x + 1].isBomb then
          numBombNeighbors = numBombNeighbors + 1
        end
      end

      self.grid[y][x].numBombNeighbors = numBombNeighbors
    end
  end
end

function GameGrid:update(dt)
end

function GameGrid:render()
  for y = 1, self.height do
    for x = 1, self.width do
      self.grid[x][y]:render(
        self.leftOffset + (x - 1) * TILE_SIZE, TOP_OFFSET + (y - 1) * TILE_SIZE
      )
    end
  end
end