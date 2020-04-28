Enemy = Class{}

function Enemy:init() 
    self.dim = 20
    self.x = math.random(TILE_WIDTH + 20, room.mapWidth * (TILE_WIDTH-1) - self.dim)
    self.y = math.random(TILE_HEIGHT + 20, room.mapHeight * (TILE_HEIGHT-1) - self.dim)
    self.img = love.graphics.newImage('grafika/troll_m.png')
    
end

function Enemy:update(dt)
    if self.x > 0 and self.x+self.dim < room.mapWidth * TILE_WIDTH - self.dim then
        self.x = self.x + math.random(0,3)
    end

    if self.y > 0 and self.y+self.dim < room.mapHeight * TILE_HEIGHT - self.dim then
        self.y = self.y + math.random(0,3)
    end
end

function Enemy:draw() 
    love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, 1)
end
