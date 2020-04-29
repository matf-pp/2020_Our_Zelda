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
    self.dead_enemies = 0
end

function StateMachine:update(dt)
    
    -- if love.keyboard.isDown('j') then
    --     dead_enemies = self.room.enemy_count
    -- end
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

        -- ako je player presao nivo
        -- prebojimo zive neprijatlje
        
        for i = 1, self.room.enemy_count do
            if self.room.enemies[i].dead == true then
                self.dead_enemies = self.dead_enemies + 1
            end
        end

        if self.room.enemy_count == self.dead_enemies then
            self.dead_enemies = 0
            self.player.health = PLAYER_HEALTH
            self.player.x = PLAYER_START_X
            self.player.y = PLAYER_START_Y

            LEVEL_DIFFICULTY = LEVEL_DIFFICULTY + 1
            self.room = Room(player)
            --self.room.enemy_count = LEVEL_DIFFICULTY * 10
            -- for i = 1, self.room.enemy_count do
            --     enemies[i].dead = false
            -- end
            --self.room.enemies = {}
            self.room:generate()
        else
            self.room:update(dt)
            self.player:update(dt)
        end

    elseif self.currentState == 'game-over' then
        if love.keyboard.isDown('return') then
            -- update player-a na staro
            self.player.health = PLAYER_HEALTH
            self.player.x = PLAYER_START_X
            self.player.y = PLAYER_START_Y
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