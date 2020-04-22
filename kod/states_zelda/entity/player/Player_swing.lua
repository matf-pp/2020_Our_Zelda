
Player_swing = Class{_includes = PrimaryState}

function Player_swing:init(player, dungeon)

    self.player = player
    self.dungeon = dungeon

    --rastojanje
    self.player.offsetY = 6
    self.player.offsetX = 9

    --create hitEnemy
    local direction = self.player.direction

    local hitEnemyX, hitEnemyY, hitEnemyHeight, hitEnemyWidth

    if direction == 'left' then
        hitEnemyHeight = 16
        hitEnemyWidth = 8
        hitEnemyX = self.player.x - hitEnemyWidth 
        hitEnemyY = self.player.y + 2
    elseif direction == 'right' then
        hitEnemyWidth = 8
        hitEnemyHeight = 16
        hitEnemyX = self.player.x + self.player.width
        hitEnemyY = self.player.y + 2
    elseif direction == 'up' then
        hitEnemyHeight = 16
        hitEnemyWidth = 8
        hitEnemyX = self.player.x 
        hitEnemyY = self.player.y - hitEnemyHeight
    else
        hitEnemyHeight = 16
        hitEnemyWidth = 8
        hitEnemyX = self.player.x 
        hitEnemyY = self.player.y + self.player.height
    end

    self.swordHitEnemy = hitEnemy(hitEnemyX, hitEnemyY, hitEnemyHeight, hitEnemyWidth)
    self.player:changeAnimation('sword-' .. self.player.direction)

end

function Player_swing:enter(params)

    gSounds['sword']:stop()
    gSounds['sword']:play()

    --restart swing sword animacije
    self.player.currentAnimation:refresh()

end

function Player_swing:update(dt)

    for k, entity in pairs(self.dungeon.currentRoom.entities) do
        if entity:collides(self.swordHitEnemy) then
            entity:damage(1)
            gSounds['hit-enemy']:play()
        end
    end

    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0
        self.player:changeState('idle')
    end

    if love.keyboard.isDown('space') then
        self.player:changeState('swing-sword')
    end

end


function Player_swing:render()

    --local anim = self.player.currentAnimation

end