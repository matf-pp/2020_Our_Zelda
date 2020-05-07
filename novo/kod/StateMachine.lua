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
        
        -- for i = 1, self.room.enemy_count do
        --     if self.room.enemies[i].dead == true then
        --         self.dead_enemies = self.dead_enemies + 1
        --     end
        -- end

        if LEVEL_DIFFICULTY * DIFFICULTY_FACTOR == DEAD_ENEMIES then
            DEAD_ENEMIES = 0
            self.player.health = PLAYER_HEALTH
            self.player.x = PLAYER_START_X
            self.player.y = PLAYER_START_Y

            LEVEL_DIFFICULTY = LEVEL_DIFFICULTY + 1
            --self.room = Room(player)
            self.room.enemy_count = LEVEL_DIFFICULTY * DIFFICULTY_FACTOR
            --for i = 1, self.room.enemy_count do
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
            DEAD_ENEMIES = 0
            self.player.health = PLAYER_HEALTH
            self.player.x = PLAYER_START_X
            self.player.y = PLAYER_START_Y
            -- pravimo novu sobu
            --self.room = Room(player)
            --self.room.player = player
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
        print('Pocetak')
    elseif self.currentState == 'play' then
        --print('Igra u toku')
        room:draw()
        player:draw()
        love.graphics.print('Enemies dead: '..DEAD_ENEMIES, 20, 20)
        love.graphics.print('Level: '..LEVEL_DIFFICULTY, 20, 30)
        love.graphics.print('Player Health: '..self.player.health, 20, 40)
    elseif self.currentState == 'game-over' then
        print('Game Over')
        love.graphics.draw(bgImage, 0, 0, 0)
    end
end