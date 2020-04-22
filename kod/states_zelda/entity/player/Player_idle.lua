Player_idle = Class{_includes = Idle_state}

function Player_idle:enter(params)
    self.entity.offsetY = 6
    self.entity.offsetX = 0
end

function Player_idle:update(dt)
    Idle_state.update(self, dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
            self.entity:changeState('walk')
    end

    if love.keyboard.wasPressed('space') then
        self.entity:changeState('swing-sword')
    end
end

function Player_idle:render()
	
end

function Player_idle:exit()
end
