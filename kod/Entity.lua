Entity = Class{}

function Entity:init(def)
	
	self.direction = 'up'

	self.anims = self:createAnimations(def.anims)

	self.x = def.x
	self.y = def.y
	self.width = def.width
	self.height = def.height

	-- za padded sprites, verovatno nam nece trebati 
        -- neka stoji ako zatreba
	-- brisemo ako ne koristimo nigde
	self.offsetX = def.offsetX or 0
	self.offsetY = def.offsetY or 0

	self.walkSpeed = def.walkSpeed

	self.health = def.health

	self.dead = false
end

function Entity:createAnimations(anims)
	local retAnims = {}

	for k, animDef in pairs(anims) do
		retAnims[k] = Animation {
			texture = animDef.texture  or 'entities',
			frames = animDef.frames,
			interval = animDef.interval
		}
	end
	return retAnims
end

function Entity:collides(target)
	return not (self.x + self.width < target.x or self.x > target.x + target.width or 
		    self.y + self.height < target.y or self.y > target.y + target.height)
end

function Entity:damage(dmg)
	self.health = self.heatlh - dmg
end

function Entity:changeState(newState)
	self.stateMachine:change(newState)
end

function Entity:changeAnimation(newState)
	self.currentAnim = self.anims[newState]
end

function Entity:update(dt)
	self.stateMachine:update(dt)

	if self.currentAnim then
        self.currentAnim:update(dt)
    end
end

function Entity:processAI(params, dt)
	self.stateMachine:processAI(params, dt)
end

function Entity:render(adjacentOffsetX, adjacentOffsetY)
	self.x, self.y = self.x + (adjacentOffsetX or 0), self.y + (adjacentOffsetY or 0)
	self.stateMachine:render()
	love.graphics.setColor(255, 255, 255)
	self.x, self.y = self.x - (adjacentOffsetX or 0), self.y - (adjacentOffsetY or 0)
end
