Room = Class{}

function Room:init(player)
	self.player = player
	self.width = MAP_WIDTH
	self.height = MAP_HEIGHT

	self.tiles = {}

	self:generateWallsAndFloors()


	self.entities = {}
	self.generateEntities()
	
	-- TODO dodati vrata
end


function generateWallsAndFloors()
	for y = 1, self.height do
		table.insert(self.tiles, {})
		for x = 1, self.width do
			local id = TILE_EMPTY -- TODO random
			
			-- coskovi i zidovi
			if x == 1 and y == 1 then
				id = TILE_TOP_L_CORNER
			elseif x == 1  and y == self.height then
				id = TILE_BOTTOM_L_CORNER
			elseif x == self.width and y == 1 then
				id = TILE_TOP_R_CORNER
			elseif x == self.width and y == self.height then
				id = TILE_BOTTOM_R_CORNER
			elseif x == 1 then
				id = TILE_L_WALLS[math.random(#TILE_L_WALLS)]
			elseif x == self.width then
				id = TILE_R_WALLS[math.random(#TILE_R_WALLS)]
			elseif y == 1 then
				id = TILE_T_WALLS[math.random(#TILE_T_WALLS)]
			elseif y == self.height then
				id = TILE_B_WALLS[math.random(#TILE_B_WALLS)]
			end
			-- dodajemo tile 
			table.insert(self.tiles[y], {
				id = id
			})
		end
	end
end

function Room:generateEntities()
	local types = {'skeleton', 'bat'}

	for i = 1, 10 do
		local type = types[math.random(#types)]
		
		table.insert(self.entities, Entity{
			anims = ENTITY_DEFS[type].anims,
			walkSpeed = ENTITY_DEFS[type].walkSpeed or 20,
			x = math.random(TILE_SIZE, GAME_WIDTH - TILE_SIZE),
			y = math.random(TILE_SIZE, GAME_HEIGHT - TILE_SIZE),
			width = 16,
			height = 16,
			health = 1
		})
		self.entities[i].stateMachine = StateMachine {
			['walk'] = function() Walk_state(self.entities[i]) end,
			['idle'] = function() Idle_state(self.entities[i]) end
		}
		self.entities[i]:changeState('walk')	
	end
end


function Room:update(dt)
	self.player:update(dt)
	
	-- update svih neprijatelja
	for i = #self.entities, 1, -1 do
		local ent = entities[i]
		
		if ent.health <= 0 then
			ent.dead = true
		elseif not ent.dead then
			ent:processAI({room = self}, dt)
			ent:update(dt)
		end
	end

	-- provera da li je neprijatelj napao igraca
	if not ent.dead and self.player:collides(ent) then
		gSounds['hit-player']:play()
		self.player:damage(1)

		if self.player.health <= 0 then
			gStateMachine:change('game-over')
		end
	end
	
end

function Room:render()
	for y = 1, self.height do
		for x = 1, self.width do
			local tile = self.tiles[y][x]
			love.graphics.draw(gTextures['tiles'], gFrames['tiles'][tile.id],
					   (x - 1) * TILE_SIZE, (y - 1) * TILE_SIZE)
		end
	end

	-- TODO iscrtati vrata


	-- crtamo igraca
	if self.player then
		self.player:render()
	end
end
