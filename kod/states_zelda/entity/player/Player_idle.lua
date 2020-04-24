Player_idle = Class{_includes = Idle_state}

function Player_idle:enter(params)
    --render offset
   -- self.entity.offsetY = 5
   -- self.entity.offsetX = 0
end

function Player_idle:update(dt)
    EntityIdleState.update(self, dt)
end

function Player_idle:update(dt)
    
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
            self.entity:changeState('walk')
    end

    if love.keyboard.isDown('space') then
        self.entity:changeState('swing-sword')
    end
end

function Player_idle:render()
	
end

function Player_idle:exit()
end
