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
			local id = TILE_EMPTY
			
			-- coskovi i zidovi
			if x == 1 and y == 1 then
				id = TILE_TOP_LEFT_CORNER
			elseif x == 1  and y == self.height then
				id = TILE_BOTTOM_LEFT_CORNER
			elseif x == self.width and y == 1 then
				id = TILE_TOP_RIGHT_CORNER
			elseif x == self.width and y == self.height then
				id = TILE_BOTTOM_RIGHT_CORNER
			elseif x == 1 then
				id = TILE_LEFT_WALLS[math.random(#TILE_LEFT_WALLS)]
			elseif x == self.width then
				id = TILE_RIGHT_WALLS[math.random(#TILE_RIGHT_WALLS)]
			elseif y == 1 then
				id = TILE_TOP_WALLS[math.random(#TILE_TOP_WALLS)]
			elseif y == self.height then
				id = TILE_BOTTOM_WALLS[math.random(#TILE_BOTTOM_WALLS)]
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
			['walk'] = function() EntityWalkState() end,
			['idle'] = function() EntityIdleState() end
		}
		self.entities[i]:changeState('walk')	
	end
end
