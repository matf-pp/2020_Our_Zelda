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
    self.enemy_count = LEVEL_DIFFICULTY * DIFFICULTY_FACTOR
    self.player = player
    self.enemies = {}
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
    -- self.enemies = {}

    for i = 1, self.enemy_count do 
        self.enemies[i] = Enemy{}
    end
end

function Room:update(dt)
    -- proveravamo helath-e neprijatelja
    for i = 1, #self.enemies do
        if self.enemies[i].health > 0 then
            --print(i..' dead')
            self.enemies[i]:update(dt)
        else --[[if not self.enemies[i].dead]] --then
            self.enemies[i].dead = true
        end

        -- provereva collison neprijatelja i igraca
        if not self.enemies[i].dead and self.player:collides(self.enemies[i]) then
            -- TODO pusti zvuk
            if not self.player.attacking then -- da neprijatelj ne bi nanosio stetu dok igrac napada
                self.player:damage(1)
            end
        end

        -- provera collision-a neprijatelja i maca
        -- ako igrac napada
        if self.player.attacking == true then
            -- proverimo da li trenutni hitbox udara nekog zivog neprijatelja
            for i = 1, #self.enemies do
                if not self.enemies[i].dead then
                    if self.enemies[i]:collides(self.player.hb) then
                        self.enemies[i]:damage(10)
                        DEAD_ENEMIES = DEAD_ENEMIES + 1
                        print('enemy'..i..'hurt, hp remaining: '..self.enemies[i].health)
                        print('enemy hurt')
                        -- TODO pustiti zvcni efekat povredjenog neprijatelja
                    end
                end
            end
        end
    end
end

function Room:draw()
    if #self.tiles ~= 0 and #self.enemies ~= 0 then -- crtamo samo ako ima nesto
        for y = 1, self.mapHeight do
            for x = 1, self.mapWidth do
                id = self.tiles[y][x]
                love.graphics.draw(tileTexture, quads[id], 
                        (x-1)*self.tileWidth, (y-1)*self.tileHeight)
            end
        end
   

        for i = 1, #self.enemies do
            if self.enemies[i].health <= 0 then
                self.enemies[i].dead = true
                self.enemies[i]:drawBox()
            elseif not self.enemies[i].dead then
                self.enemies[i]:draw()
                self.enemies[i]:drawBox()
            end
        end
    end
end

function Room:destroy()
    -- brisanje svih elemenata sobe
    self.enemies = {}
    self.tiles = {}
end

-- self.setTile = function(x, y, tile)
--     self.tiles[(y-1) * self.mapWidth + x] = tile
-- end
-- self.tile = love.graphics.newImage('img/cobble_blood1.png')