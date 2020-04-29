print('[+] Room module loaded')

Room = Class{}

function Room:init(player)
    self.tiles = {}
    self.tileWidth = TILE_WIDTH
    self.tileHeight = TILE_HEIGHT
    self.mapWidth = 32 
    self.mapHeight = 32
    self.pixlesX = self.tileWidth * self.mapWidth
    self.pixlesY = self.tileHeight * self.mapHeight
    self.enemy_count = 10
    self.player = player
end

function Room:generate() 
    for y = 1, self.mapHeight, 1 do
        self.tiles[y] = {}
        for x = 1, self.mapWidth, 1 do
            tileId = 1
            -- provera za coskove
            if x == 1 and y == 1 then
                tileId = TILE_TOP_LEFT_CORNER
            elseif x == 1 and y == self.mapHeight then
                tileId = TILE_BOTTOM_LEFT_CORNER
            elseif x == self.mapWidth and y == 1 then
                tileId = TILE_TOP_RIGHT_CORNER
            elseif x == self.mapWidth and y == self.mapHeight then
                tileId = TILE_BOTTOM_RIGHT_CORNER
            -- provera za zidove
            elseif x == 1 then 
                tileId = TILE_LEFT_WALLS[math.random(#TILE_LEFT_WALLS)]
            elseif x == self.mapWidth then 
                tileId = TILE_RIGHT_WALLS[math.random(#TILE_RIGHT_WALLS)]
            elseif y == 1 then
                tileId = TILE_TOP_WALLS[math.random(#TILE_TOP_WALLS)]
            elseif y == self.mapHeight then
                tileId = TILE_BOTTOM_WALLS[math.random(#TILE_BOTTOM_WALLS)]
            else -- inace je pod
                tileId = TILE_FLOORS[math.random(#TILE_FLOORS)]
            end
            table.insert(self.tiles[y],tileId)
        end
    end

    -- making enemies
    enemies = {}

    for i = 1, self.enemy_count do 
        enemies[i] = Enemy{}
    end
end

function Room:update(dt)
    for i = 1, self.enemy_count do
        if enemies[i].health <= 0 then
            enemies[i].dead = true
        elseif not enemies[i].dead then
            enemies[i]:update(dt)
        end

        if not enemies[i].dead and self.player:collides(enemies[i]) then
            -- TODO pusti zvuk
            self.player:damage(1)
        end
    end
end

function Room:draw()
    for y = 1, self.mapHeight do
        for x = 1, self.mapWidth do
            id = self.tiles[y][x]
            love.graphics.draw(tileTexture, quads[id], 
                      (x-1)*self.tileWidth, (y-1)*self.tileHeight)
        end
    end

    for i = 1, self.enemy_count do
        if enemies[i].health <= 0 then
            enemies[i].dead = true
        elseif not enemies[i].dead then
            enemies[i]:draw()
        end
    end

end

-- self.setTile = function(x, y, tile)
--     self.tiles[(y-1) * self.mapWidth + x] = tile
-- end
-- self.tile = love.graphics.newImage('img/cobble_blood1.png')