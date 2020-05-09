HitBox = Class{}

function HitBox:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    print('HitBox Napravljen')
end

function HitBox:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    -- if self.direction == 'up' then
    --     love.graphics.rectangle("fill", 
    --                             self.player.x + self.player.width/2, 
    --                             self.player.y - self.player.height - self.height, 
    --                             self.height, 
    --                             self.width)
    -- elseif self.direction == 'down' then
    --     -- zamah na dole
    --     love.graphics.rectangle("fill", 
    --                             self.player.x + self.player.width/2, 
    --                             self.player.y + self.player.height + self.height, 
    --                             self.height, 
    --                             self.width)
    -- elseif self.direction == 'left' then
    --     -- zamah na levo
    --     love.graphics.rectangle("fill", 
    --                             self.player.x, 
    --                             self.player.y - self.player.height/2, 
    --                             self.height, 
    --                             self.player.x - self.width)
    -- elseif self.direction == 'right' then  
    --     -- zamah na desno
    --     love.graphics.rectangle("fill", 
    --                             self.player.x + self.player.width/2, 
    --                             self.player.y - self.player.height - self.height, 
    --                             self.height, 
    --                             self.width)
    -- end
end
