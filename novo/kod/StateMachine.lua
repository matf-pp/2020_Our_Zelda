StateMachine = Class{}

-- Stanja:
-- start
-- play
-- game over

function StateMachine:init(room, player)
    self.currentState = 'start'
    self.room = room
    self.nextRoom = nil
    self.player = player
end

function StateMachine:update(dt)
    if self.currentState == 'start' then
        if love.keyboard.isDown('return') then
            self.currentState = 'play'
        elseif love.keyboard.isDown('escape') then
            love.event.quit()
        end
    elseif self.currentState == 'play' then
        -- provera da li je player ziv
        if self.player.health <= 0 then
            self.currentState = 'game-over'
        end
        self.room:update()
        self.player:update()
    elseif self.currentState == 'game-over' then
        if love.keyboard.isDown('return') then
            -- update player-a na staro
            self.player.health = PLAYER_HEALTH
            self.player.x = 200
            self.player.y = 200
            -- pravimo novu sobu
            self.room = Room(player)
            self.room:generate()
            -- prelazimo u play stanje
            self.currentState = 'play'
        elseif love.keyboard.isDown('escape') then
            love.event.quit()
        end
    end
end

function StateMachine:draw()
    if self.currentState == 'start' then
        love.graphics.draw(bgImage, 0, 0, 0)        
    elseif self.currentState == 'play' then
        room:draw()
        player:draw()
    elseif self.currentState == 'game-over' then
        love.graphics.draw(bgImage, 0, 0, 0)
    end
end