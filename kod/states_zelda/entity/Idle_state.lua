
Idle_state = Class{_includes = PrimaryState}

function Idle_state:init(entity)

    self.entity = entity

    self.changeAnimation('idle-' .. self.entity.direction)

    --AI cekanje
    self.waitDuration = 0
    self.waitTimer = 0

end

function Idle_state:processAI(params, dt)

    if self.waitDuration == 0 then
        self.waitDuration = math.random(6)
    else 
        self.waitTimer = self.waitTimer + dt

        if self.waitTimer > self.waitDuration then
            self.entity:changeState('walk')
        end
    end
end

function Idle_state:render()

    --local anim = self.entity.currentAnimation
    
end

function Idle_state:update(dt)
end

function Idle_state:exit()
end
