Player_walk = Class{_includes = Walk_state}


function Player_walk:enter(params)
end

function Player_walk:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    --koordinate za neprejatelja
    self.entity.offsetY = 6
    self.entity.offsetX = 0

end

function Player_walk:update(dt)
    if love.keyboard.isDown('right') then
        self.entity.direction = 'right'
        self.entity:changeAnimation('walk-right')
    elseif love.keyboard.isDown('left') then
        self.entity.direction = 'left'
        self.entity:changeAnimation('walk-left')
    elseif love.keyboard.isDown('up') then
        self.entity.direction = 'up'
        self.entity:changeAnimation('walk-up')
    elseif love.keyboard.isDown('down') then
        self.entity.direction = 'down'
        self.entity:changeAnimation('walk-down')
    else
        self.entity.changeState('idle')
    end

    if love.keyboard.wasPressed('space') then
        self.entity.changeState('swing-sword')
    end
end

