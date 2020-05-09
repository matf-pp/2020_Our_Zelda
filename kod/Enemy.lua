Enemy = Class{}

function Enemy:init() 
    self.dim = 20
    self.width = 20
    self.height = 20
    -- ne sme neprijatelj da se pojavi na mestu gde je igrac jer ce ga ostetiti
    -- trazimo koordinate takve  da se 100px oko igraca
    self.x = math.random(TILE_WIDTH + 20, room.mapWidth * (TILE_WIDTH-1) - self.width)
    self.y = math.random(TILE_HEIGHT + 20, room.mapHeight * (TILE_HEIGHT-1) - self.height)
    while math.sqrt(math.abs(self.x - PLAYER_START_X) * math.abs(self.x - PLAYER_START_X) +
                    math.abs(self.y - PLAYER_START_Y) * math.abs(self.y - PLAYER_START_Y)) < 70 do -- merimo distancu od starta igraca
        self.x = math.random(TILE_WIDTH + 20, room.mapWidth * (TILE_WIDTH-1) - self.width)
        self.y = math.random(TILE_HEIGHT + 20, room.mapHeight * (TILE_HEIGHT-1) - self.height)
    end
    --self.img = love.graphics.newImage('grafika/troll_m.png')
    self.health = 1 -- ENEMY_HEALTH
    self.speed = ENEMY_SPEED
    self.direction = ENEMY_DIRECTIONS[math.random(#ENEMY_DIRECTIONS)]
    self.walking_time = 0
    self.dead = false
    
end

function Enemy:update(dt)
    self.walking_time = self.walking_time + dt
    if self.walking_time >= ENEMY_WALK_TIME then
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

    --print('enemy moved')
end

function Enemy:draw() 
    -- crtamo odgovarajucu sliku zavisno od smera kretanja
    local quad_id = nil
    if self.direction == 'up' then
        quad_id = ENEMY_UP_TILE
    elseif self.direction == 'down' then
        quad_id = ENEMY_DOWN_TILE
    elseif self.direction == 'left' then
        quad_id = ENEMY_LEFT_TILE
    elseif self.direction == 'right' then
        quad_id = ENEMY_RIGHT_TILE
    end
    love.graphics.draw(enemyImg, enemy_quads[quad_id], 
                      self.x, self.y)
end

function Enemy:drawBox()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end


function Enemy:collides(target)
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                self.y + self.height < target.y or self.y > target.y + target.height)
end

function Enemy:damage(dmg)
    -- self.heatlh = -100
    self.dead = true
end