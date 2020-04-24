play = Class{_include = PrimaryState}

function play:init()
	-- podesavamo parametre za igraca
	-- kasnije ga dodamo u dungeon i sobu
	self.player = Player{
		anims = ENTITY_DEFS['player'].anims,
		walkSpeed = ENTITY_DEFS['player'].walkSpeed,
		x = GAME_WIDTH / 2,
		y = GAME_HEIGHT / 2,
		width = 16,
		height = 32,
		health = 6,
		offsetY = 5
	}

	self.dungeon = Dungeon(self.Player)
	self.currentRoom = Room(self.Player)

	-- paramteri za stanja igraca
	self.player.stateMachine = StateMachine {
		['walk'] = function() return Player_walk(self.player, self.dungeon) end,
		['idle'] = function() return Player_idle(self.player) end,
		['swing-sword'] = function() return Player_swing(self.player, self.dungeon) end
	}

	self.player:changeState('idle')
end

function play:enter(params)
end

function play:exit()
end

function play:update(dt)
        -- za izlaz iz igre
        if love.keyboard.isDown('escape') then
            love.event.quit()
        end

	-- u update-u dungeona se desava logika igre	
	self.dungeon:update(dt)
end

function play:render()
	-- prvo crtamo dungeon
	-- sa .push cuvamo trenutno stanje grafike
	-- da bi mogli da se vratimo nazad i crtamo normalno posle
	love.graphics.push()
	self.dungeon:render()
	love.graphics.pop() -- vracamo grafiku na prethondno stanje posle crtanja dungeon-a


	-- crtamo health bar
	love.graphics.print('Health', 0, 0, 1, 1, 0, 0, 0, 0)
end
