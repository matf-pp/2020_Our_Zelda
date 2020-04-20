StateMachine = Class{}

print('StateMachiine ucitan')

-- konstruktor
function StateMachine:init(states)
	self.empty = {
		render = function() end,
		update = function() end,
		processAI = function() end,
		enter = function() end,
		exit = function() end
	}

	self.states = states or {} 
	self.current = self.empty
end

function StateMachine:change(newState, stateParams)
	assert(self.states[newState])
	self.current:exit() -- zavrsimo trenutno stanje
	self.current = self.states[newState]()
	self.current:enter(stateParams)
end

function StateMachine:update(dt)
	self.current:update(dt)
end

function StateMachine:render()
	self.current:render()
end

function StateMachine:processAI(params, dt)
	self.current.processAI(params, dt)
end

