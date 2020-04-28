print('[+] Player module loaded')

Player = Class{}


function Player:init()
    self.x = 200
    self.y = 200
    self.yspeed = 4
    self.xspeed = 4
    self.dim = 20
    self.direction = 'none'
    self.img = love.graphics.newImage('grafika/troll_m.png')
end


function Player:update(dt) 
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
    elseif love.keyboard.isDown( 'escape') then
        love.event.quit()
    elseif love.keyboard.isDown('j') then
        room:generate()
    end
end

function Player:draw() 
    love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, 1)
end
