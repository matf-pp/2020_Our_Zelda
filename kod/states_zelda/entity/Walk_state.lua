Walk_state = Class{_includes = PrimaryState}

function Walk_state:enter(params)
	
end

function Walk_state:init(entity, dungeon)
	self.entity = entity
	self.dungeon = dungeon

	self.entity:changeAnimation('walk-down')

	self.moveDuration = 0
	self.movementTimer = 0

	self.bumped = false -- da li je udario zid
end

function Walk_state:update(dt)
	self.bumped = false	
	if self.entity.direction == 'left' then
		self.entity.x = self.entity.x - self.entity.walkSpeed * dt
		if self.entity.x <= TILE_SIZE then
			self.entity.x = TILE_SIZE
			self.bumped = true
		end
	elseif self.entity.direction == 'right' then
		self.entity.x = self.entity.x + self.entity.walkSpeed * dt
	
		if self.entity.x + self.entity.width >= GAME_WIDTH - TILE_SIZE * 2 then
			self.entity.x = GAME_WIDTH - TILE_SIZE * 2 - self.entity.width	
			self.bumped = true
		end
	elseif self.entity.directin == 'up' then
		self.entity.y = self.entity.y - self.entity.walkSpeed * dt
		if self.entity <= TILE_SIZE - self.entity.height/2 then
			self.entity.y = TILE_SIZE - self.entity.height / 2
			self.bumped = true
		end
	elseif self.entity.direction == 'down' then
		self.entity.y = self.entity.y + self.entity.walkSpeed * dt
		local bottomEdge = GAME_HEIGHT * TILE_SIZE - TILE_SIZE
		if self.entity.y + self.entity.height >= bottomEdge then
			self.entity.y = bottomEdge - self.entity.height
			self.bumped = true
		end
	end
end

function Walk_state:processAI(params, dt)
	local room = params.room
	local directions = {'left', 'right', 'up', 'down'} 
	if self.moveDuration == 0 or self.bumped then
		self.moveDuration = math.random(5)
		self.entity.direction = directions[math.random(#directions)]
		self.entity:changeAnimation('walk-' .. tostring(self.entity.direction))
	elseif self.movementTimer > self.moveDuration then
		self.movementTimer = 0
		
		if math.random(3) == 1 then
			self.entity:changeState('idle')
		else
			self.moveDuratin =  math.random(5)
			self.entity.direction = directions[math.random(#directions)]
			self.entity:changeAnimation('walk-' .. tostring(self.entity.direction))
		end
	self.movementTimer = self.movementTimer + dt
	end
end

function Walk_state:render()
	local anim = self.entity.currentAnim
	love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
			math.floor(self.entity.x), math.floor(self.entity.y))
end

function Walk_state:exit()
end
