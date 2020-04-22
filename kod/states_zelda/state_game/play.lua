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

	-- paramteri za stanja igraca
	self.player.stateMachine = StateMachine {
		['idle-state'] = function() Player_idle() end,
		['walk-state'] = function() Player_walk() end,
		['swing-sword'] = function() Player_swing() end,
	}

	self.player:changeState('idle-state')

	self.dungeon = Dungeon(self.Player)
	self.room = Room(self.Player)
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
