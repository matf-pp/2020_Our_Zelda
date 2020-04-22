Dungeon = Class{}

function Dungeon:init(player)
	self.player = player

	self.rooms = {}

	self.currentRoom = Room(self.player)
	self.nextRoom = nil

	self.cameraX = 0
	self.cameraY = 0
	self.shifting = false

	Event.on('shift', function() 
		self:beginShifting()
	end)
end


function Dungeon:beginShifting()
	self.shifting = true

	self.nextRoom = Room(self.player)
	gSounds['newRoom']:play()
end


function Dungeon:finishShifting()
	self.cameraX = 0
	self.cameraY = 0
	self.shifting = false
	self.currentRoom = self.nextRoom
	self.nextRoom = nil
end


function Dungeon:update(dt)
	if not self.shifting then
		self.currentRoom:update(dt)
	else
		self.player.currentAnimation:update(dt)
	end	
end


function Dungeon:render()
	if self.shifting then
		love.graphics.print('NEW ROOM', 0,0, 1,1,0,0,0,0)
	end
	
	self.currentRoom:render()
	
	if self.nextRoom then
		self.nextRoom:render()
	end
end
