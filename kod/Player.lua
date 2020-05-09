print('[+] Player module loaded')

Player = Class{}


function Player:init()
    self.x = PLAYER_START_X
    self.y = PLAYER_START_Y
    self.yspeed = 2
    self.xspeed = 2
    self.dim = 20
    self.width = 20
    self.height = 20
    self.direction = 'up'
    --self.img = love.graphics.newImage('grafika/troll_m.png')
    self.health = PLAYER_HEALTH
    self.hb = nil
    self.attacking = false
    self.attack_timer = 0
    self.attack_cooldown = ATTACK_COOLDOWN
end


function Player:update(dt) 
    if self.attacking == true then
        self.attack_timer = self.attack_timer + dt
    end

    if self.attack_timer >= self.attack_cooldown then
        self.attacking = false
        self.attack_timer = 0
        self.hb = nil
    end

    if love.keyboard.isDown('up') and self.y > 0 then
        self.direction = 'up'
        self.y = self.y - self.yspeed
    elseif love.keyboard.isDown('down') 
    and self.y + TILE_HEIGHT+self.dim < room.mapHeight * TILE_HEIGHT then
        self.direction = 'down'
        self.y = self.y + self.yspeed
    elseif love.keyboard.isDown('right')
    and self.x + TILE_WIDTH + self.dim < room.mapWidth * TILE_WIDTH then
        self.direction = 'right'
        self.x = self.x + self.xspeed
    elseif love.keyboard.isDown('left') 
    and self.x > 0 then
        self.direction = 'left'
        self.x = self.x - self.xspeed
    elseif love.keyboard.isDown('space') then
        local direction = self.direction
        local hitboxX, hitboxY, hitboxWidth, hitboxHeight

        if direction == 'left' then
            hitboxWidth = 8
            hitboxHeight = 20
            hitboxX = self.x - hitboxWidth
            hitboxY = self.y + 2
        elseif direction == 'right' then
            hitboxWidth = 8
            hitboxHeight = 20
            hitboxX = self.x + self.width
            hitboxY = self.y + 2
        elseif direction == 'up' then
            hitboxWidth = 20
            hitboxHeight = 8
            hitboxX = self.x
            hitboxY = self.y - hitboxHeight
        else
            hitboxWidth = 20
            hitboxHeight = 8
            hitboxX = self.x
            hitboxY = self.y + self.height
        end
        self.hb = HitBox(hitboxX, hitboxY, hitboxWidth, hitboxHeight)
        self.attacking = true
        playerSwingSword:play()
    elseif love.keyboard.isDown( 'escape') then
        love.event.quit()
    end
end

function Player:draw() 

    -- na osnovu toga da li igrac napada
    -- crtamo odgovarajucu sliku
    local player_quads
    local playerImg
    if self.attacking == true then
        player_quads = player_attack_quads
        playerImg = playerAttackImg
    else
        player_quads = player_walk_quads
        playerImg = playerWalkImg
    end
    -- crtamo odgovarajucu sliku zavisno od smera kretanja
    local quad_id = nil
    if self.direction == 'up' then
        quad_id = PLAYER_UP_TILE 
    elseif self.direction == 'down' then
        quad_id = PLAYER_DOWN_TILE
    elseif self.direction == 'left' then
        quad_id = PLAYER_LEFT_TILE
    elseif self.direction == 'right' then
        quad_id = PLAYER_RIGHT_TILE
    end
    love.graphics.draw(playerImg, player_quads[quad_id], 
                      self.x, self.y)

    if self.hb ~= nil then
        --self.hb:draw()
        print('attack')
    end
end

function Player:collides(target)
    local selfY, selfHeight = self.y + self.height / 2, self.height - self.height / 2
    
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                selfY + selfHeight < target.y or selfY > target.y + target.height)
end



function Player:damage(dmg)
    self.health = self.health - dmg
end
