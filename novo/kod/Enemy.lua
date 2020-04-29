Enemy = Class{}

function Enemy:init() 
    self.dim = 20
    self.width = 20
    self.height = 20
    self.x = math.random(TILE_WIDTH + 20, room.mapWidth * (TILE_WIDTH-1) - self.width)
    self.y = math.random(TILE_HEIGHT + 20, room.mapHeight * (TILE_HEIGHT-1) - self.height)
    self.img = love.graphics.newImage('grafika/troll_m.png')
    self.health = ENEMY_HEALTH
    self.speed = ENEMY_SPEED
    self.direction = ENEMY_DIRECTIONS[math.random(#ENEMY_DIRECTIONS)]
    self.walking_time = 0
    
end

function Enemy:update(dt)
    self.walking_time = self.walking_time + dt
    if self.walking_time >= 1 then
        -- vratim tajmer na nulu
        self.walking_time = 0
        -- odaberemo novi nasumican pravac
        if self.x > 0 
        and self.x+self.width < room.mapWidth * TILE_WIDTH - self.width
        and self.y > 0 
        and self.y+self.height < room.mapHeight * TILE_HEIGHT - self.height then
        -- biramo nasumican pravac ako igrac ima prostora za kretanje
        -- TODO dodata da menja pravac svakih X sekundi
        self.direction = ENEMY_DIRECTIONS[math.random(#ENEMY_DIRECTIONS)]
    end
    end
    

    -- da promeni smer u suprotan ako je zakacio zid
    -- levi zid
    if self.x <=  0 then 
        self.direction = 'right'
    -- desni zid
    elseif self.x >= room.mapWidth * TILE_WIDTH - self.width then 
        self.direction = 'left'
    -- gornji zid
    elseif self.y <= 0 then 
        self.direction = 'down'
    -- doniji zid
    elseif self.y >= room.mapWidth * TILE_WIDTH - self.width then 
        self.direction = 'up'
    end

    -- pomeranje neprijatelja po svom pravcu
    if self.direction == 'up' then
        self. y = self.y - self.speed
    elseif self.direction == 'down' then
        self.y = self.y + self.speed
    elseif self.direction == 'left' then
        self.x = self.x - self.speed
    elseif self.direction == 'right' then
        self.x = self.x + self.speed
    end
end

function Enemy:draw() 
    -- crtamo odgovarajucu sliku zavisno od smera kretanja
    if self.direction == 'up' then
        love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, 1)
    elseif self.direction == 'down' then
        love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, 1)
    elseif self.direction == 'left' then
        love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, 1)
    elseif self.direction == 'right' then
        love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, 1)
    end
    
end
