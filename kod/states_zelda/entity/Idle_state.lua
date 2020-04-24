Idle_state = Class{_includes = PrimaryState}



function Idle_state:init(entity)

    self.entity = entity

    self.entity:changeAnimation('idle-' .. self.entity.direction)

    --AI cekanje
    self.waitDuration = 0
    self.waitTimer = 0

end

function Idle_state:enter(params)
end

function Idle_state:exit()
end

function Idle_state:update(dt)
end

function Idle_state:processAI(params, dt)

    if self.waitDuration == 0 then
        self.waitDuration = math.random(5)
    else 
        self.waitTimer = self.waitTimer + dt

        if self.waitTimer > self.waitDuration then
            self.entity:changeState('walk')
        end
    end
end

function Idle_state:render()

    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y- self.entity.offsetY))
    
end




